# Generated by Django 3.1.1 on 2020-09-24 11:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('zooapi', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='socre',
            field=models.IntegerField(blank=True, default=0, help_text='积分', null=True),
        ),
    ]
