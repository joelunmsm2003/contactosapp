# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-05-12 03:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0079_auto_20180408_1555'),
    ]

    operations = [
        migrations.AlterField(
            model_name='socia',
            name='telefono',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
