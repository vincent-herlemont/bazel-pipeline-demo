import requests
import unittest
import util


class TestGetNumber(unittest.TestCase):
  SERVICE_URL = ""

  def test_200(self):
     response = requests.get(self.SERVICE_URL+"/test")
     self.assertEqual(response.status_code,200)


if __name__ == '__main__':
  TestGetNumber.SERVICE_URL = util.get_service_url("server")
  unittest.main()