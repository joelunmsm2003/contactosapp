# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-05-28 00:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0080_auto_20180511_2243'),
    ]

    operations = [
        migrations.CreateModel(
            name='Configuracion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'verbose_name': 'Configuracion',
                'managed': True,
            },
        ),
    ]
