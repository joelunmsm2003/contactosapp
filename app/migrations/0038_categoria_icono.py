# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-12-20 05:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0037_auto_20171219_2322'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='icono',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
    ]
