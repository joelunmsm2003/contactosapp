# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-07-28 16:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0112_auto_20180726_2133'),
    ]

    operations = [
        migrations.AddField(
            model_name='servicio',
            name='dato_lugar',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
