# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-03-09 21:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0058_cliente_sexo'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='photo_facebook',
            field=models.CharField(blank=True, max_length=5000, null=True),
        ),
    ]
