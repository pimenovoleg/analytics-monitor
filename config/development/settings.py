from path import path

DB_NAME = 'boots'
DB_USER = 'root'
DB_PASSWORD = 'root'
DB_MASTER = 'localhost'
DB_SLAVE = 'localhost'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': DB_NAME,
        'USER': DB_USER,
        'PASSWORD': DB_PASSWORD,
        'HOST': DB_MASTER,
        'PORT': '3306',
        'OPTIONS': {
            'local_infile': True,
            'init_command': 'SET character_set_server=UTF8; SET storage_engine=InnoDB'
        },
        'TEST_CHARSET': 'utf8',
        'TEST_COLLATION': 'utf8_general_ci',
    }
}

DEBUG = True
