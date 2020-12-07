import requests
import unittest
import util

class TestSendNumber(unittest.TestCase):
  SERVICE_URL = ""

  def dispatcher_200(self): 
    url=self.SERVICE_URL+"/dispatcher"
    response = requests.post(
      url=url,
      data=b'42',
      headers={'Content-Type': 'application/binary'}
    )
    self.assertEqual(response.status_code,200)


if __name__ == '__main__':
  util.init()
  TestSendNumber.SERVICE_URL = util.get_service_url("dispatcher")
  unittest.main()