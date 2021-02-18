## Bots Open Source EDI Translator

1. Bots is fully functional software for EDI (Electronic Data Interchange).
2. All major EDI data formats are supported: EDIFACT, X12, TRADACOMS, XML.
3. This is a Linux build using bots version 3.2.0 and python 2.7
4. Bots is very stable.
5. Bots handles high volumes of edi transactions.
6. Bots is flexible and can be configurated for your specific EDI needs.
7. More info? > https://bots.readthedocs.io/en/latest/

This build also runs on OpenShift 4.6

The deployment has optional ConfigMap entries to adjust your bots.ini and settings.py files.
I am not including those files as templates, so pull your own from the image and customize for 
your environment. Create your configmaps like so: \
`oc create configmap $CM_NAME --from-file=$FILE_NAME`
