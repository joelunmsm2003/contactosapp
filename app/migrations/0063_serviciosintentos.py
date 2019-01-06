# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-03-21 22:27
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0062_auto_20180321_1704'),
    ]

    operations = [
        migrations.CreateModel(
            name='Serviciosintentos',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(blank=True, max_length=1000, null=True)),
                ('servicio', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Servicio')),
                ('socia', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Socia')),
            ],
            options={
                'verbose_name': 'Servicio/Intento',
                'managed': True,
            },
        ),
    ]
