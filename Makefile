HELM_DESTINATION=efk-logging-app

default: template

template :
		helm template --namespace efk --name efk ./helm/$(HELM_DESTINATION)