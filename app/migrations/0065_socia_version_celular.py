# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-03-22 03:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0064_auto_20180321_1858'),
    ]

    operations = [
        migrations.AddField(
            model_name='socia',
            name='version_celular',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
