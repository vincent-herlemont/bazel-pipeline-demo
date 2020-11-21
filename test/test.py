import requests
import unittest

class TestGetNumber(unittest.TestCase):

  def test_200(self):
     response = requests.get("http://api.zippopotam.us/us/90210")
     self.assertEqual(response.status_code,200)

if __name__ == '__main__':
  unittest.main()