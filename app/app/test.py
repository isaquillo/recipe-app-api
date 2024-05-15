""""
Sample Test
"""

from django.test import SimpleTestCase

from app import calc

class CalcTests(SimpleTestCase):
    """Test the calc module

    Args:
        SimpleTestCase (_type_): _description_
    """
    def test_add_numbers(self):
        res = calc.add(5, 6)

        self.assertEqual(res, 11)

