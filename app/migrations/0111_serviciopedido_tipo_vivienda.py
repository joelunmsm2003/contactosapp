# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-07-27 02:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0110_serviciopedido_cantidad'),
    ]

    operations = [
        migrations.AddField(
            model_name='serviciopedido',
            name='tipo_vivienda',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
