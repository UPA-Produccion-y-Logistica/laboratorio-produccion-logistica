import unittest

from simulacion.sr01_salabim import run_model


class SR01SimulationTest(unittest.TestCase):
    def test_capacity_improvement_increases_output(self):
        base = run_model(1)
        capacity = run_model(2)
        self.assertEqual(base["completed"], 58)
        self.assertEqual(capacity["completed"], 77)
        self.assertGreater(capacity["throughput_per_day"], base["throughput_per_day"])
        self.assertLess(capacity["avg_lead_time"], base["avg_lead_time"])
        self.assertEqual(capacity["avg_test_wait"], 0.0)


if __name__ == "__main__":
    unittest.main()
