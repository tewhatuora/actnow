Instance: AnCapabilityStatement
InstanceOf: HnzToolingCapabilityStatement 
Description: "Server capability statement"
Usage: #definition

* name = "CanShareCapabilityStatement"
* title = "ACT-NOW Capability Statement"
* description = "ACT-NOW capability statement"
* status = #draft
* date = "2022-10-03"
* publisher = "David Hay"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server

* contact[+].name = "Health New Zealand Te Whatu Ora"
* contact[=].telecom.value = "https://www.tewhatuora.govt.nz"
* contact[=].telecom.system = #url

* implementation.description = "Health NZ | Te Whatu Ora ACT NOW API"
* implementation.url = "https://fhir.api.digital.health.nz/R4"
* version = "1.0.0"

* rest.security.cors = true
* rest.security.service = #SMART-on-FHIR
* rest.security.description = "OAuth 2.0 - Client Credential flow."
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/token"
* rest.security.extension.extension[+].url = "authorize"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/authorize"
* rest.security.extension[+].url = "http://fhir-registry.smarthealthit.org/StructureDefinition/capabilities"
* rest.security.extension[=].valueCode = #client-confidential-symmetric

* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].url = Canonical(HnzCustomHeadersExtension)
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[key].valueString = "X-Correlation-Id"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Correlation-Id.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = false
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[+].extension[key].valueString = "Request-Context"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[value].valueUri = "https://raw.githubusercontent.com/tewhatuora/schemas/main/shared-care/Request-Context.json"
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[required].valueBoolean = true
* extension[HnzApiSpecBuilderExtension].extension[globalHeaders].extension[=].extension[documentation].valueString = """A base64-encoded JSON object that defines the context of the current request.
See https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context-v2.json for the schema this object must conform to.
"""
* extension[HnzApiSpecBuilderExtension].extension[licenseURL].valueUri = "https://www.tewhatuora.govt.nz/assets/Our-health-system/Digital-health/Digital-Service-Hub/API-Access-and-Use-Agreement.docx"
* extension[HnzApiSpecBuilderExtension].extension[licenseName].valueString = "Health New Zealand Digital Services Hub API Access and Use Agreement"
* extension[HnzApiSpecBuilderExtension].extension[externalDocs].valueUri = "https://fhir-ig.digital.health.nz/actnow"

* rest.interaction[+].code = #transaction


* rest.resource[+].type = #Patient
* rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-patient"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].name = "gender"
* rest.resource[=].searchParam[=].type = #token


/* No longer profiling Practitioner
* rest.resource[+].type = #Practitioner
* rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-practitioner"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token



* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].name = "gender"
* rest.resource[=].searchParam[=].type = #token
*/

* rest.resource[+].type = #CarePlan
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-cycle"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #Observation
// ? add all profiles * rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"

* rest.resource[=].supportedProfile[+] = $cT
* rest.resource[=].supportedProfile[+] = $cN
* rest.resource[=].supportedProfile[+] = $cM
* rest.resource[=].supportedProfile[+] = $cGroup

* rest.resource[=].supportedProfile[+] = $pT
* rest.resource[=].supportedProfile[+] = $pN
* rest.resource[=].supportedProfile[+] = $pM
* rest.resource[=].supportedProfile[+] = $pGroup

* rest.resource[=].supportedProfile[+] = $bsa
* rest.resource[=].supportedProfile[+] = $creat-clear
* rest.resource[=].supportedProfile[+] = $height
* rest.resource[=].supportedProfile[+] = $weight
* rest.resource[=].supportedProfile[+] = $histology
* rest.resource[=].supportedProfile[+] = $ecog
//* rest.resource[=].supportedProfile[+] = ""


* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #MedicationAdministration
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-medication-administration"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-medication-request"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].conditionalCreate = true
