"""Modelo didáctico de eventos discretos para el caso SR-01.

La práctica intencionalmente deja visibles los parámetros y los KPI para que
el estudiante pueda modificar una hipótesis por corrida.
"""

import argparse
import statistics

import salabim as sim


# Demand deliberately exceeds the capacity of the thermal test station in
# the base scenario so that the bottleneck is visible in the classroom demo.
HORIZON_MIN = 5 * 480
UNITS_PER_DAY = 18
ARRIVAL_INTERVAL_MIN = 480 / UNITS_PER_DAY
PROCESS_TIMES = {
    "cut": 20,
    "assembly": 30,
    "test": 40,
    "pack": 15,
}


class Unit(sim.Component):
    completed_units = []

    def __init__(self, resources, process_times, **kwargs):
        self.resources = resources
        self.process_times = process_times
        self.waits = {}
        self.entered_at = None
        super().__init__(**kwargs)

    def process(self):
        self.entered_at = env.now()
        for station in ("cut", "assembly", "test", "pack"):
            resource = self.resources[station]
            queued_at = env.now()
            yield self.request(resource)
            self.waits[station] = env.now() - queued_at
            yield self.hold(self.process_times[station])
            self.release(resource)

        self.completed_units.append(
            {
                "id": self.name(),
                "completed_at": env.now(),
                "lead_time": env.now() - self.entered_at,
                "wait_test": self.waits["test"],
            }
        )


class DemandSource(sim.Component):
    def __init__(self, resources, process_times, total_units, **kwargs):
        self.resources = resources
        self.process_times = process_times
        self.total_units = total_units
        super().__init__(**kwargs)

    def process(self):
        for index in range(1, self.total_units + 1):
            Unit(
                self.resources,
                self.process_times,
                name=f"SR01-{index:03d}",
            )
            yield self.hold(ARRIVAL_INTERVAL_MIN)


def run_model(test_capacity):
    global env
    env = sim.Environment(trace=False, random_seed=2026, yieldless=False)
    Unit.completed_units = []
    resources = {
        "cut": sim.Resource("cut", capacity=1),
        "assembly": sim.Resource("assembly", capacity=1),
        "test": sim.Resource("test", capacity=test_capacity),
        "pack": sim.Resource("pack", capacity=1),
    }
    DemandSource(resources, PROCESS_TIMES, total_units=90)
    env.run(till=HORIZON_MIN)

    completed = Unit.completed_units
    if not completed:
        return {"completed": 0, "throughput_per_day": 0, "avg_lead_time": None, "avg_test_wait": None}

    return {
        "completed": len(completed),
        "throughput_per_day": round(len(completed) / 5, 2),
        "avg_lead_time": round(statistics.mean(x["lead_time"] for x in completed), 2),
        "avg_test_wait": round(statistics.mean(x["wait_test"] for x in completed), 2),
        "max_test_wait": round(max(x["wait_test"] for x in completed), 2),
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--scenario", choices=("base", "capacity"), default="base")
    args = parser.parse_args()
    capacity = 1 if args.scenario == "base" else 2
    print({"scenario": args.scenario, **run_model(capacity)})


if __name__ == "__main__":
    main()
