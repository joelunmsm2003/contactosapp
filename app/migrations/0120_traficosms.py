# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-08-10 21:25
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0119_auto_20180805_2239'),
    ]

    operations = [
        migrations.CreateModel(
            name='TraficoSMS',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mensaje', models.CharField(blank=True, max_length=1000, null=True)),
                ('telefono', models.CharField(blank=True, max_length=1000, null=True)),
                ('fecha', models.DateTimeField(blank=True, default=datetime.datetime(2018, 8, 10, 16, 25, 12, 520936), null=True)),
            ],
            options={
                'verbose_name': 'Trafico SMS',
                'managed': True,
            },
        ),
    ]
