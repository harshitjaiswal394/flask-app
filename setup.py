from setuptools import setup, find_packages

setup(
    name="flask-app",  # package name (must be unique in PyPI repo)
    version="0.1.0",
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        "Flask>=3.0.0",
        "gunicorn>=21.0.0",
    ],
    entry_points={
        "console_scripts": [
            "flask-app=app.__init__:main",
        ],
    },
)
