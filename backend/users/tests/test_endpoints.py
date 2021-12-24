from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from model_bakery import baker
from django.contrib.auth import get_user_model
import datetime

User = get_user_model()


class TestUserCreateEndpoint(APITestCase):
    def setUp(self):
        self.create_url = reverse('user-list')

    def test_create_user(self):
        """
        Ensure we can create a new user
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        user = User.objects.get(email=data['email'])

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(user.email, data['email'])
        self.assertEqual(user.first_name, data['first_name'])
        self.assertEqual(user.last_name, data['last_name'])
        self.assertTrue(user.check_password(data['password']))

    def test_create_user_with_missing_email(self):
        """
        Ensure error codes when missing email
        """
        data = {
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(first_name=data['first_name']))

    def test_create_user_with_missing_first_name(self):
        """
        Ensure error codes when missing first_name
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_missing_last_name(self):
        """
        Ensure error codes when missing last_name
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_missing_password(self):
        """
        Ensure error codes when missing password
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': 'Franklin',
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_invalid_email(self):
        """
        Ensure error codes when invalid email
        """
        data = {
            'email': 'ben_franklin',
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_invalid_password(self):
        """
        Ensure error codes when invalid password
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': ''
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_invalid_first_name(self):
        """
        Ensure error codes when invalid first_name
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': '',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_user_with_invalid_last_name(self):
        """
        Ensure error codes when invalid last_name
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': '',
            'password': 'BenFranklin123'
        }

        response = self.client.post(self.create_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertRaises(User.DoesNotExist,
                          lambda: User.objects.get(email=data['email']))

    def test_create_duplicate_user(self):
        """
        Ensure error codes when duplicate user
        """
        data1 = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben1',
            'last_name': 'Franklin1',
            'password': 'BenFranklin123'
        }

        response1 = self.client.post(self.create_url, data1, format='json')

        data2 = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben2',
            'last_name': 'Franklin2',
            'password': 'BenFranklin123'
        }

        response2 = self.client.post(self.create_url, data2, format='json')

        self.assertEqual(response1.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response2.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.filter(email=data1['email']).count(), 1)

    def test_create_user_read_only_fields(self):
        """
        Ensure read_only_fields cannot be set on creation
        """
        time = datetime.datetime(
            year=2000, month=1, day=1, hour=0, minute=0, second=0
        )
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': 'BenFranklin123',

            'pk': -1,
            'date_joined': time,
            'last_login': time,
            'is_active': False,
            'is_staff': True,
            'is_superuser': True,
        }

        response = self.client.post(self.create_url, data, format='json')

        user = User.objects.get(email=data['email'])

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertNotEqual(user.pk, -1)
        self.assertNotEqual(user.date_joined, time)
        self.assertNotEqual(user.last_login, time)
        self.assertNotEqual(user.is_active, False)
        self.assertNotEqual(user.is_staff, True)
        self.assertNotEqual(user.is_superuser, True)


class TestUserRetrieveEndpoint(APITestCase):
    def setUp(self):
        self.user = baker.make(User)
        self.retrieve_url = reverse('user-detail', kwargs={'pk': self.user.pk})

    def test_retrieve_user(self):
        """
        Ensure we can retrieve a user and response only contains expected fields
        """
        response = self.client.get(self.retrieve_url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(
            set(response.data.keys()),
            {'pk', 'email', 'first_name', 'last_name', 'date_joined', 'last_login', 'is_active', 'is_staff', 'is_superuser'})
        self.assertFalse('password' in response.data)

    def test_retrieve_user_not_found(self):
        """
        Ensure error is thrown if user is not found
        """
        url = reverse('user-detail', kwargs={'pk': self.user.pk + 1})
        response = self.client.get(url)

        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class TestUserUpdateEndpoint(APITestCase):
    def setUp(self):
        self.user = baker.make(User)
        self.update_url = reverse('user-detail', kwargs={'pk': self.user.pk})

    def test_partial_update_user(self):
        """
        Ensure we can partial update a user
        """
        data = {
            'first_name': 'Ben',
            'last_name': 'Franklin',
        }

        response = self.client.patch(self.update_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_full_update_user(self):
        """
        Ensure we can full update a user
        """
        data = {
            'email': 'ben_franklin@upenn.edu',
            'first_name': 'Ben',
            'last_name': 'Franklin',
            'password': 'BenFranklin123'
        }

        response = self.client.put(self.update_url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)


class TestUserDeleteEndpoint(APITestCase):
    def setUp(self):
        self.user = baker.make(User)
        self.delete_url = reverse('user-detail', kwargs={'pk': self.user.pk})

    def test_delete_user(self):
        """
        Ensure we can delete a user
        """
        user = baker.make(User)

        response = self.client.delete(self.delete_url)

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

    def test_delete_user_not_found(self):
        pass


class TestUserListEndpoint(APITestCase):
    def setUp(self):
        self.user1 = baker.make(User)
        self.user2 = baker.make(User)
        self.list_url = reverse('user-list')

    def test_list_users(self):
        """
        Ensure we can list all users
        """
        response = self.client.get(self.list_url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)
