# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-08-06 03:10
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0115_auto_20180803_1153'),
    ]

    operations = [
        migrations.AddField(
            model_name='servicio',
            name='eliminado',
            field=models.BooleanField(default=True),
        ),
    ]
