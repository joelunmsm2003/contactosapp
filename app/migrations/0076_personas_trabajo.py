# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-04-08 19:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0075_auto_20180408_1201'),
    ]

    operations = [
        migrations.AddField(
            model_name='personas',
            name='trabajo',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
