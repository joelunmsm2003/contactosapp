# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-02-25 04:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0050_auto_20180217_1548'),
    ]

    operations = [
        migrations.CreateModel(
            name='Publicidad',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
                ('photo', models.FileField(blank=True, null=True, upload_to='static')),
                ('enlace', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'verbose_name': 'Portada/Photo',
                'managed': True,
            },
        ),
        migrations.AlterModelOptions(
            name='categoria',
            options={'managed': True, 'verbose_name': 'Categoria'},
        ),
        migrations.AlterModelOptions(
            name='subcategoria',
            options={'managed': True, 'verbose_name': 'Subcategoria'},
        ),
        migrations.AddField(
            model_name='portadaphoto',
            name='enlace',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='sociasubcategoria',
            name='comentario',
            field=models.TextField(blank=True, max_length=1000, null=True),
        ),
    ]
