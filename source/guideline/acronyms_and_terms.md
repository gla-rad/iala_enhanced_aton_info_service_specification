\pagebreak

# Acronyms and Terminology {#sec:acronyms_and_terminology}

## Acronyms {#sec:acronyms}

| Term       | Definition                         |
| ---------- | ---------------------------------- |
| ***API***  | Application Programming Interface  |
| ***MC***   | Maritime Cloud                     |
| ***MEP***  | Message Exchange Pattern           |
| ***MRN***  | Maritime Resource Name             |
| ***NAF***  | NATO Architectural Framework       |
| ***REST*** | Representational State Transfer    |
| ***SOA***  | Service Oriented Architecture      |
| ***SOAP*** | Simple Object Access Protocol      |
| ***SSD***  | Service Specification Document     |
| ***UML***  | Unified Modelling Language         |
| ***URL***  | Uniform Resource Locator           |
| ***VTS***  | Vessel Traffic Service             |
| ***WSDL*** | Web Service Definition Language    |
| ***XML***  |Extendible Mark-up Language         |
| ***XSD***  | XML Schema Definition              |

: List of Acronyms {#tbl:acronyms}

| Term | Definition |
| ---  | ---        |
| ***External Data Model*** | Describes the semantics of the “maritime world” (or a significant part thereof) by defining data structures and their relations. This could be at logical level (e.g., in UML) or at physical level (e.g., in XSD schema definitions), as for example standard data models, or S-100 based data produce specifications. |
| ***Message Exchange Pattern*** | Describes the principles how two different parts of a message passing system (in our case: the service provider and the service consumer) interact and communicate with each other. Examples: 1) In the Request/Response MEP, the service consumer sends a request to the service provider in order to obtain certain information; the service provider provides the requested information in a dedicated response. 2) In the Publish/Subscribe MEP, the service consumer establishes a subscription with the service provider in order to obtain certain information; the service provider publishes information (either in regular intervals or upon change) to all subscribed service consumers. |
| ***Operational Activity*** | An activity performed by an operational node. Examples of operational activities in the maritime context are: Route Planning, Route Optimization, Logistics, Safety, Weather Forecast Provision, ... |
| ***Operational Model*** | A structure of operational nodes and associated operational activities and their inter-relations in a process model. |
| ***Operational Node*** | A logical entity that performs activities. Note: nodes are specified independently of any physical realisation. Examples of operational nodes in the maritime context are: Maritime Control Center, Maritime Authority, Ship, Port, Weather Information Provider, ... |
| ***Service*** | The provision of something (a non-physical object), by one, for the use of one or more others, regulated by formal definitions and mutual agreements. Services involve interactions between providers and consumers, which may be performed in a digital form (data exchanges) or through voice communication or written processes and procedures. |
| ***Service Consumer*** | A service consumer uses service instances provided by service providers. All users within the maritime domain can be service customers, e.g., ships and their crew, authorities, VTS stations, organizations (e.g., meteorological), commercial service providers, etc. |
| ***Service Data Model*** | Formal description of one dedicated service at logical level. The service data model is part of the service specification. Is typically defined in UML and/or XSD. If an external data model exists (e.g., a standard data model), then the service data model shall refer to it: each data item of the service data model shall be mapped to a data item defined in the external data model. |
| ***Service Design Description*** | Documents the details of a service technical design (most likely documented by the service implementer). The service design description includes (but is not limited to) a service physical data model and describes the used technology, transport mechanism, quality of service, etc. |
| ***Service Implementation*** | The provider side implementation of a dedicated service technical design (i.e., implementation of a dedicated service in a dedicated technology). |
| ***Service Implementer*** |Implementers of services from the service provider side and/or the service consumer side. Anybody can be a service implementer but mainly this will be commercial companies implementing solutions for shore and ship. |
| ***Service Instance*** | One service implementation may be deployed at several places by same or different service providers; each such deployment represents a different service instance, being accessible via different URLs. |
| ***Service Instance Description*** | Documents the details of a service implementation (most likely documented by the service implementer) and deployment (most likely documented by the service provider). The service instance description includes (but is not limited to) service technical design reference, service provider reference, service access information, service coverage information, etc. |
| ***Service Interface*** | The communication mechanism of the service, i.e., interaction mechanism between service provider and service consumer. A service interface is characterised by a message exchange pattern and consists of service operations that are either allocated to the provider or the consumer of the service. |
| ***Service Operation*** | Functions or procedure which enables programmatic communication with a service via a service interface. |
| ***Service Physical Data Model*** | Describes the realisation of a dedicated service data model in a dedicated technology. This includes a detailed description of the data S-124 to be exchanged using the chosen technology. The actual format of the service physical data model depends on the chosen technology. Examples may be WSDL and XSD files (e.g., for SOAP services) or swagger (Open API) specifications (e.g., for REST services). If an external data model exists (e.g., a standard data model), then the service physical data model shall refer to it: each data item of the service physical data model shall be mapped to a data item defined in the external data model. In order to prove correct implementation of the service specification, there shall exist a mapping between the service physical data model and the service data model. This means, each data item used in the service physical data model shall be mapped to a corresponding data item of the service data model. (In case of existing mappings to a common external (standard) data model from both the service data model and the service physical data model, such a mapping is implicitly given.) |
| ***Service Provider*** | A service provider provides instances of services according to a service specification and service instance description. All users within the maritime domain can be service providers, e.g., authorities, VTS stations, organizations (e.g., meteorological), commercial service providers, etc. |
| ***Service Specification*** | Describes one dedicated service at logical level. The Service Specification is technology-agnostic. The Service Specification includes (but is not limited to) a description of the Service Interfaces and Service Operations with their data S-124. The data S-124 description may be formally defined by a Service Data Model. |
| ***Service Specification Producer*** | Producers of service specifications in accordance with the service documentation guidelines. |
| ***Service Technical Design*** | The technical design of a dedicated service in a dedicated technology. One service specification may result in several technical service designs, realising the service with different or same technologies. |
| ***Service Technology Catalogue*** | List and specifications of allowed technologies for service implementations. Currently, SOAP and REST are envisaged to be allowed service technologies. The service technology catalogue shall describe in detail the allowed service profiles, e.g., by listing communication standards, security standards, stacks, bindings, etc. |
| ***Spatial Exclusiveness*** | A service specification is characterised as “spatially exclusive”, if in any geographical region just one service instance of that specification is allowed to be registered per technology. The decision, which service instance (out of a number of available spatially exclusive services) shall be registered for a certain geographical region, is a governance issue. |

: List of Terms {#tbl:terminology}
