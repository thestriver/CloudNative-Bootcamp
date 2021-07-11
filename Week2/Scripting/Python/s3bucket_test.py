import unittest

class Test3(unittest.TestCase):
    def test_bucket_name_value(self):
        bucket = "cloudskillscodevore"

        self.assertEqual(bucket, 'cloudskillscodevore')
    
    def test_region_value(self):
        region = 'us-east-2'

        self.assertEqual(region, 'us-east-2')

    def test_bucket_name_is_string(self):
        bucket = "cloudskillscodevore"

        self.assertTrue(type(bucket), str)
    
    def test_region_is_string(self):
        region = 'use-east-2'

        self.assertTrue(type(region), str)


if __name__ == '__main__':
    unittest.main()