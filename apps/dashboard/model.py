from django.db import models


class DashBoardModel(models.Model):
    title = models.CharField(max_length=255)
    is_done = models.BooleanField(default=False)

    def __unicode__(self):
        return self.title