from django.test import TestCase
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from model_bakery import baker
from django.conf import settings

User = get_user_model()


class UserModelManagerTest(TestCase):
    def test_object_manager_create_user(self):
        test_1 = User.objects.create_user(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        )
        test_1_db = User.objects.get(email='ben_franklin@upenn.edu')
        self.assertEqual(test_1, test_1_db)
        self.assertFalse(test_1_db.is_superuser)
        self.assertFalse(test_1_db.is_staff)

    def test_object_manager_create_superuser(self):
        test_1 = User.objects.create_superuser(
            email='george_washington@gtown.edu',
            first_name='George',
            last_name='Washington',
            password='georgewashington123'
        )
        test_1_db = User.objects.get(email='george_washington@gtown.edu')
        self.assertEqual(test_1, test_1_db)
        self.assertTrue(test_1_db.is_superuser)
        self.assertTrue(test_1_db.is_staff)

    def test_object_manager_create_user_invalid_password(self):
        self.assertRaises(ValidationError, lambda: User.objects.create_user(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password=''
        ))

    def test_object_manager_create_superuser_invalid_password(self):
        self.assertRaises(ValidationError, lambda: User.objects.create_superuser(
            email='george_washington@gtown.edu',
            first_name='George',
            last_name='Washington',
            password=''
        ))

    def test_create_user_password_validations(self):
        self.assertRaises(ValidationError, lambda: User.objects.create_user(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password=''
        ))
        self.assertRaises(ValidationError, lambda: User.objects.create_user(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='a'
        ))

    def test_create_superuser_password_validations(self):
        self.assertRaises(ValidationError, lambda: User.objects.create_superuser(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password=''
        ))
        self.assertRaises(ValidationError, lambda: User.objects.create_superuser(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='a'
        ))


class UserModelTest(TestCase):
    def test_get_full_name(self):
        users = baker.make(User, _quantity=settings.NUM_TESTS)
        for user in users:
            self.assertEqual(user.get_full_name(),
                             f"{user.first_name} {user.last_name}")

    def test_get_short_name(self):
        users = baker.make(User, _quantity=settings.NUM_TESTS)
        for user in users:
            self.assertEqual(user.get_short_name(), user.first_name)

    def test_default_create_user(self):
        test_1 = User.objects.create(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        )
        test_1_db = User.objects.get(email='ben_franklin@upenn.edu')
        self.assertEqual(test_1, test_1_db)

    def test_email_validations(self):
        self.assertRaises(ValidationError, lambda: User.objects.create(
            email='',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        ))
        self.assertRaises(ValidationError, lambda: User.objects.create(
            email='invalidemail',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        ))

    def test_name_validations(self):
        self.assertRaises(ValidationError, lambda: User.objects.create(
            email='ben_franklin@upenn.edu',
            first_name='',
            last_name='Franklin',
            password='benfranklin123'
        ))
        self.assertRaises(ValidationError, lambda: User.objects.create(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='',
            password='benfranklin123'
        ))

    def test_duplicate_user_validations(self):
        test_1 = User.objects.create(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        )
        self.assertRaises(ValidationError, lambda: User.objects.create(
            email='ben_franklin@upenn.edu',
            first_name='Ben',
            last_name='Franklin',
            password='benfranklin123'
        ))
