# Introduction {#sec:introduction}
 
This document describes the technical service for the exchange of Enhanced Aids to Navigation (AtoN) Information for AtoN Authorities, following the IALA guideline G1128 [@cite:iala-g1128]. In the context of e-Navigation, there is a number of maritime services, each referencing a number of associated technical services. The technical services themselves are described in three levels:

* Service specification (this document)

* Service design (one or more)

* Service instance (one or more)

All the above documents are part of G1128 and are explained in that guideline.

The exchange of Enhanced AtoN Information for AtoN Authorities makes use of the IALA S-201 data model, which is outlined in the S-201 data product specification. According to IALA, the S-201 - Aids to Navigation (AtoN) Information [@cite:iala-s201] data product provides a common structure for the exchange of information about AtoNs including metadata like maintenance schedules, equipment type such as battery and bulb types. This includes buoys, beacons, racons, lights, sound signals and AIS. The product specification can be used to exchange AtoN information in a consistent form between Lighthouse Authorities, Hydrographic Offices and other organisations to include commercial and professional agencies. This specific technical service may be referenced in other S-1xx product specifications and maritime services including MS12 - Nautical Publications and MS2 - AtoN.

This service specification may be used with the Maritime Connectivity Platform (MCP), where the MCP would provide means of authentication of service providers and service consumers as well as means of service discoverability.

## Purpose of the Document {#sec:introduction_purpose}

The purpose of this service specification document is to provide a holistic overview of the service and its building blocks in a technology-independent way, according to the G1128 guideline. It describes a well-defined baseline of the service by clearly identifying the service version.

The aim is to document the key aspects of the service at the logical level:

* the operational and business context of the service

    * requirements for the service (e.g., information exchange requirements)

    * involved nodes: which operational components provide/consume the service

    * operational activities supported by the service

    * relation of the service to other services

* the service description

    * service operations

    * service operation parameters

    * service payload definition

    * service dynamic behaviour description

* service provision and validation aspects

## Intended Readership {#sec:intended_readership}

This service specification is intended to be read by service architects, system engineers and developers in charge of designing and developing an instance of the service.

Furthermore, this service specification is intended to be read by enterprise architects, service architects, information architects, system engineers and developers in pursuing architecting, design and development activities of other related services.

## Definitions {#sec:definitions}

The following definitions describe terms used in this specification: 

* **Aid to Navigation (AtoN)** - A device, system or service, external to vessels, designed and operated to enhance safe and efficient navigation.

* **Navigational Warning (NW)** - A broadcast message containing urgent information relevant to safe navigation.

* **Maritime Safety Information (MSI)** - Navigational and meteorological warnings, meteorological forecasts and other urgent safety-related messages.

* **Navaid** - An instrument, device or nautical publication carried on board a vessel for the purpose of assisting navigation.

* **NAVAREA** - A geographical sea area, as shown in the appendix IMO A.706(17) established for the purpose of co-ordinating the transmission of radio navigational warnings. Where appropriate, the term NAVAREA followed by an identifying roman numeral may be used as a short title. The delimitation of such areas is not related to and shall not prejudice the delimitation of any boundaries between States. 

* **NAVAREA** Co-ordinator - The authority charged with co-ordinating, collating and issuing long-range navigational warnings and NAVAREA warnings bulletins to cover the whole of the NAVAREA.

* **NAVTEX** - Single frequency time-shared broadcast system with automated reception and message rejection/selection facilities. Use of NAVTEX is regulated by the IMO NAVTEX Manual (IMO publication 951).

* **SafetyNET Service** – Dedicated international satellite broadcast system with automated reception and message rejection/selection facilities. 

* **SafetyCast Service** – Dedicated international mobile satellite service in the Global Maritime Distress and Safety System (GMDSS) for broadcasting navigational warnings, meteorological warnings and forecasts, and Search and Rescue (SAR) related information.
