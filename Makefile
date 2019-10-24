HELM_DESTINATION=efk-logging-stack

default: build

build :
		helm package ./helm/efk-logging-curator -d ./helm/$(HELM_DESTINATION)/charts
		helm package ./helm/efk-logging-elasticsearch -d ./helm/$(HELM_DESTINATION)/charts
		helm package ./helm/efk-logging-fluentd -d ./helm/$(HELM_DESTINATION)/charts
		helm package ./helm/efk-logging-kibana -d ./helm/$(HELM_DESTINATION)/charts

template :
		helm template --namespace efk --name efk ./helm/$(HELM_DESTINATION)

clean :
		rm ./helm/$(HELM_DESTINATION)/charts/*.tgz