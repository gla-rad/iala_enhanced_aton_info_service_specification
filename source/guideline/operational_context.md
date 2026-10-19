\pagebreak

# Operational Context {#sec:operational_context}

This section describes the context of the service from an operational perspective.

## Pre S-201 Operational Context {#sec:pres_201_operational_context}

This service specification describes the mechanism in which AtoN authorities exchange the relevant AtoN information with other authorities within its area of responsibility, as well as internationally. Typically a national AtoN authorities are entrusted with the following responsibilities:

* Supervise and approve **all** AtoN in the area, including the territorial sea and the EEZ;
* Establish, operate and fund the state AtoN in main routes, through-passages and safe anchorages;
* Be the registered IHO producer (DK01) for **S-201** and in some cases **S-124 and S-125**.

National AtoN Authorities (NAAs) collaborate closely with other Local AtoN Authorities (LAAs), exchanging information daily. As a principle, any entity that creates the need for marking also establishes, is also responsible for funding and maintaining it. This covers ports, bridges, offshore wind farms, offshore installations, cables and pipelines, aquaculture, and construction projects. Each such AtoN typically needs a permit by the NAA to be established, changed, moved or withdrawn. Owners must report faults **immediately**, and report the final repair as well. As a result, a large share of AtoN information originates *outside* the NAA. Regardless the NAA remains its authoritative source.

Up to the introduction of S-201 however, the sharing of AtoN information is quite fragmented, with multiple point-to-point non-interoperable systems, manual steps and long production periods. In many cases AtoN changes are shared via Notices-to-Mariners (NtM), which get published and appended onto the List-of-Lights (LoL) nautical publications. LoL updates can then be synchronised with chat corrections, which get more widely distributed. However, this process could take up to several months to be completed.

Even in the cases where certain administrations have progressed with their digitalisation efforts, introducing data sharing automation mechanisms, the system are primarily based on non-standardised data data structures. In addition, multiple levels of data access are employed to control the dissemination of information.

| Function Name | Function Description |
| --- | --- |
| AtoN Provision | In line with IALA definition [@cite:iala-dict-2023}], competent AtoN authorities' mission is to deliver a reliable, efficient and cost-effective aids to navigation service for the benefit and safety of all mariners. |
| AtoN Maintenance | State AtoN are serviced from operations centres and by the inspection vessels. Third-party AtoN are maintained by the owners or their contractors. |
| AtoN Register | The NAA typically maintains an AtoN register and is considered as the authoritative source for all AtoN information in its area of responsibility. |
| Status reports | LAAs, mariners, pilots, as well as the NAA's own field staff report by phone, e-mail or web form. Usually the NNA reviews the reports manually. |
| NW/NtM Promulgation | NAAs typically produce Navigational Warnings (NW) and Notice to Mariners (NtM), promulgated via NAVTEX, VHF, web, APIs, or a daily bulletin via mailing lists. |
| AtoN design-state to HO | Changes are passed to the HO  for ENC correction, typically without a standardised API-based data exchange. |

: The typical functions of a National AtoN Authority. {#tbl:naa_pres_operational_functions}

Typical End-Users include:

* HOs
* Maintenance Companies/Contractors
* VTS (AtoN & Bathymetry)
* Requests for LoL information (including unlighted AtoN – mostly software charts/ECS) - Current electronic publications not in useful formats
*	Port Authorities managing areas
* MRCC

## Envisioned Operational Context {#sec:envisioned_operational_context}

A standardized structured AtoN information format would enable compatible systems to exchange AtoN information seamlessly. Each AtoN Administration may have a unique AtoN Information Management System. This system however, should be able to automatically promulgate AtoN data from the authoritative source, for use by national and local authorities (e.g. Coastal State Authorities, Harbor and Port Authorities), public, as well as being available for use by maintenance providers and commercial contractors. 

AtoN Administrations will administer and publish local AtoN data, for their area of responsibility. Typically this includes areas within that state’s exclusive economic zone. Where appropriate they should coordinate with adjacent or overlapping AtoN Administrations who share responsibility within the same waterway.  (e.g. Both the U.S. Coast Guard and Canadian Coast Guard maintain aids to navigation within the waterways comprising the Great Lakes.) The service instance descriptions will provide detailed information of coverage area available to users.

![Example of the AtoN information flow, as per [@cite:iala-ms2].](../../resources/AtoNInfoDistribution.png){#fig:ms_aton_information_flow}

The service described in this specification defines the exchange of enhanced AtoN information using S-201 between a service provider and the end-user of such a service. In the most common case, according to the IALA interpretation of the IMO *MS-2 Aids to Navigation* maritime service [@cite:iala-ms2], as illustrated in [@fig:ms_aton_information_flow], the end user will be a member of staff of another Lighthouse Authority or a Hydrographic Office. It may also be used to harmonise the exchange of AtoN information between the various stakeholders in the data distribution chain before it is propagated towards the mariners.

Depending on the specific requirements, the service usage patterns may differ. For example, a Hydrographic Office could pull all available data and subscribe to updates from a data producer (e.g. national AtoN authority) and redistribute the data to the RENCs via S-101 and S-125 (after applying validation checks or optimising the data for a specific group of end-users). The orchestration of multiple AtoN information services in the distribution chain, however, is not in the scope of this document and lies within the responsibility of the service provider(s).

### Relationships between S-S201 and S-101, S-124, S-125 {#sec:relationship_124_s125_s201}

IHO has produced guidance on the interoperability between S-201 and the S-101, S-124, S-125 data product specifications [@cite:iho-s125-interoperability-guide]. This document provides guidance on how S-125 will work on ECDIS devices and mentions the change of scope for editions 1.0.0 and 2.0.0 of the data product. This change limits the scope of S-125 to an overlay displaying only information on any AtoN status changes, which differ from the design state that appears in S-101. For more information please refer the IHO document.

### Discoverability and Dissemination {#sec:discoverability_and_dissemination}

The S-201 data should be discoverable only by Hydrographic Offices, Coastal State Authorities and other relevant authorised organisations. S-201 data should enhance S-101 ENC, S-124 NW and S-125 AtoN digital services, especially by reducing the effort in the transformation of data, with the harmonization of data models. This could be accomplished by introducing efficient data exchange mechanism between authorities.

## Functional and Non-functional Requirements {#sec:functional_non_functional_reqs}

The table below defines the functional requirements, as there are defined in the IALA documentation for the IMO MS-2 Aids to Navigation Maritime Service [@cite:iala-ms2]. Please note that the feature identifiers referenced in [@tbl:ms2-functional-requirements], are also referring to service features identified in the IALA MS-2 specification document.

| Requirement Type | Requirement ID | Requirement Name | Requirement Text | Feature Identifier |
| --- | --- | --- | --- | --- |
| **Functional** | MS2-FR001 | Provision of dataset(s) | The service provides S-100 compliant dataset(s) with all current and valid AtoN Information assigned to that dataset(s). | F001, F005 |
| **Functional** | MS2-FR002 | On-demand request for dataset(s) | The end users can receive on demand S-100 compliant dataset(s).  Service providers will respond with current data relevant to the request but will not subdivide datasets to less than that defined by the authoritative source of the data. | F001, F005 |
| **Functional** | MS2-FR003 | Filter AtoN Information | The end-users can filter the AtoN information based on a point, line, polygon geometry, AtoN type, AtoN status etc. | F001, F008 |
| **Functional** | MS2-FR004 | Retrieve AtoN Status Updates | The end-users are able to request and filter out only the AtoN which have associated status changes. | F001, F008 |
| **Functional** | MS2-FR005 | Subscribe to dataset(s) | The end users can subscribe to receive S-100 compliant dataset(s) and their respective updates. Subscription requests should be able to include the start and stop time of the subscription. | F002, F004, F005 |
| **Functional** | MS2-FR006 | Status of Subscription | The service provides a subscription status notification. This could indicate termination of subscription from the service provider side. | F002, F003 |
| **Functional** | MS2-FR007 | Data Update Status | The service must be able to provide the users with the status of their respective subscriptions and whether the current dataset is the latest one, along with other relevant information. | F002, F006 |
| **Functional** | MS2-FR008 | Cancellation of Subscription | The service provides a facility to cancel the subscription. | F004 |
| **Functional** | MS2-FR009 | Data Authenticity Certificate | The service can provide on demand the security certificate that was used to secure the data transmission. | F006, F009 |
| **Functional** | MS2-FR012 | Information Filtering | The end users can filter the relevant AtoN information by name or based on a point, line, polygon geometry, or receive the complete service content.  | F008 |
| **Functional** | MS2-FR013 | Delivery Acknowledgement Request | The service is able to request a data delivery acknowledgement for any end-user. The requested acknowledgement should support multiple levels (receiving, reading etc.) | F011 |
| **Functional** | MS2-FR014 | Delivery Acknowledgement Confirmation | The service provides a common but secure facility for all end-users to acknowledge the successful updates of AtoN information if requested. | F011 |
| **Functional** | MS2-FR015 | Subscription Updates | The service is able to identify and contact the subscribed end-users to push updates on the requested dataset(s). | F012 |
| **Functional** | MS2-FR016 | Input Automation | The service updates the advertised datasets, based on the AtoN status updates received, including S-201 data (status changes, planned AtoN) received from authorised submitters such as AtoN owners, applicants and maintenance providers. | F013 |
| **Functional** | MS2-FR017 | Change Log | The service allows data producers to track the record of changes to the advertised dataset(s) for any time interval required. | F015 |
| **Functional** | MS2-FR018 | Change Log State | The service allows data producers to view the full state of the AtoN Information as provided to consumers at any past point in time. | F015 |
| **Functional** | MS2-FR019 | Validation feedback | Each submission is validated (schema, known MRN, submitter's responsibility for the AtoN) and accepted or rejected with a reason. | UC #3, #4 |
| **Functional** | MS2-FR020 | Persistent identification | Each AtoN is identified by an MRN assigned by the AtoN authority. The MRN is stable across dataset editions and is reusable in S-101, S-124 and S-125. | Lesson 1 |
| **Functional** | MS2-FR021 | Multilingual text | Free-text information can be provided in the national language and English. | DK practice (Danish/English) |

: Functional Requirements for the MS-2 – Aids to Navigation  Service. {#tbl:ms2-functional-requirements}

The table below defines non-functional requirements for the S-201 service, as these are defined in the IALA documentation for the IMO MS-2 Aids to Navigation Maritime Service [@cite:iala-ms2]. Please note that the feature identifiers referenced in [@tbl:ms2-non-functional-requirements], are also referring to service features identified in the IALA MS-2 specification document.

| Requirement Type | Requirement ID | Requirement Name | Requirement Text | Feature Identifier |
| --- | --- | --- | --- | --- |
| **Non-functional** | MS2-NFR001 | Authorization | Service consumers are authorized by the provider for reception of data by the service. This may be public authorization (everyone has access), or limited authorization associated with a transactional service | F010, F016, F017 |
| **Non-functional** | MS2-NFR002 | Authenticity | Service consumers can verify independently the authenticity of the AtoN information transmitted to them. | F006, F009 |
| **Non-functional** | MS2-NFR003 | Integrity | It is clear to both service provider and consumer whether changes have been made to the AtoN information after this was created. | F006, F009 |
| **Non-functional** | MS2-NFR004 | Availability | The service is consistently available in its ability to deliver AtoN Information to its consumers. (i.e. Service should have a high availability) | F001, F002, F004, F005, F011, F013 |
| **Non-functional** | MS2-NFR005 | Responsiveness | The service provides a response to a service consumer’s request without delay, and the data provided should be (near) real time. | F001, F002, F011, F016 |
| **Non-functional** | MS2-NFR006 | Performance | The service can handle multiple requests simultaneously (e.g. 1000/sec). | F001, F010, F012 |
| **Non-functional** | MS2-NFR007 | Portability | The service makes the data available in portable machine-readable formats (e.g. XML/JSON) | F014 |
| **Non-functional** | MS2-NFR008 | Compression | The service is able transmit the data in compressed format, with the compression method (e.g., gzip) clearly indicated. | F001, F005, F008 |
| **Non-functional** | MS2-NFR009 | Accessibility | The AtoN information is accessible as much as possible and modern APIs should be supported for machine-to-machine communication. | F005, F010, F013, F014 |
| **Non-functional** | MS2-NFR010 | Compatibility | The service is compatible with as many end-user devices as possible and conforms to the latest relevant maritime standards (e.g. IEC 63173-2 (SECOM), S-100 (S-124, S-125, S-201, S-240)) | F005, F010, F013, F014 |
| **Non-functional** | MS2-NFR011 | Scoped authorisation | Authorisation can be scoped to the AtoN or area a consumer or submitter is responsible for, not only "public" or "authority". | UC #3, #4 |
| **Non-functional** | MS2-NFR012 | Auditability of inputs | All received submissions and acknowledgements are logged with submitter, time and content. This extends Change Log / Change Log State to inbound data. | UC #3; Marking Order § 13 |
| **Non-functional** | MS2-NFR013 | Fallback | Unavailability of the service must not prevent reporting through established manual channels. Re-synchronisation after recovery is supported. | UC #3 |

: Non-Functional Requirements for the MS-2 – Aids to Navigation Service. {#tbl:ms2-non-functional-requirements}

## Other Constraints {#sec:other_constraints}

### Relevant Industrial Standards {#sec:relevant_industrial_standards}

Not Applicable

### Operational Nodes {#sec:operational_nodes}

The following tables describe the operational nodes of the service.

| Operational Node | Remarks |
| --- | --- |
| ***AtoN Administration – AtoN Information Management System*** | The AtoN Information Management System collects all AtoN Information available from its Authoritative Source (AtoN Administration). |
| ***Coastal State Authority*** | Governmental Agency responsible for overseeing vessel arrival within a respective area. Should facilitate dissemination of S-201. | 
| ***Discoverable Service*** | S-201 services must be discoverable and may be operated by public or private entities. |
| ***Service Consumer*** | Consumers of S-201 service. This includes only state authorities and relevant organisations such as Hydrographic Offices and Coastal State Authorities. |

: Operational Nodes providing the S-201 service. {#tbl:operational_nodes}

### Operational Activities {#sec:operational_activities}

The following tables describe the operational activities of the service.

| Operational Activity | Remarks |
| --- | --- |
| ***Identify S-201 Dataset(s)*** | The service consumer is able to identify the availability of S-201 dataset(s) for a given area.  This includes identification of the authoritative source for the dataset(s). |
| ***Get S-201 Dataset(s)*** | The service consumer is able to retrieve S-201 dataset(s) from the service provider.  This includes retrieving archived dataset(s). |
| ***Subscribe*** | The service consumer is able to subscribe to receive S-201 dataset(s) from the service provider for a given timeframe and area. |
| ***Version Designation*** | The service provider needs to track the current version of S-201 dataset(s) and make this discoverable to service consumers. |
| ***Record of Changes*** | The service provider needs to log changes between versions of S-201 dataset(s). |
| ***Dissemination of Changes*** | The “delta” compilation of changes made to a dataset(s) since the last version was issued may be made available to service consumer before the release of a new dataset version. |

: Operational Activities supported by the S-201 service. {#tbl:operational_activities}

### Use Cases {#sec:use-cases}

#### Use-case #1

**Name**: Retrieve AtoN status indication information for portrayal by a Hydrographic Office

**Description**: Retrieve and portray changes on the design state of AtoN for charting.

**Actors**: AtoN information service, Hydrographic Office

**Frequency of Use**: Ad-hoc, typically triggered upon an update request by the Hydrographic Office

**Pre-conditions**: The service instance is known to the relevant system or has access to a service registry in which the service instance can be discovered. Data is packaged in S-201 datasets with MRN attributes populated. S-201 datasets cannot be broken apart into division beyond those established by the authoritative source for liability reasons.

**Ordinary Sequence**:

  1. The AtoN status indication information is requested from the service.
  2. The service directly answers the request with the appropriate data. These include the S-201 AtoN status indication features of the data product, but  not necessarily the design state AtoN information.
  3. The data is rendered and displayed to the user.

**Post-conditions**: The correct AtoN status indication information is displayed.

#### Use-case #2

**Name**: Retrieve AtoN status indication information for portrayal by an ECS Provider

**Description**: Retrieve and portray changes on the design state of AtoN for charting.

**Actors**: AtoN information service, ECS Provider

**Frequency of Use**: Ad-hoc, typically triggered upon an update request by the ECS Provider

**Pre-conditions**: The service instance is known to the relevant system or has access to a service registry in which the service instance can be discovered. Data is packaged in S-201 datasets with MRN attributes populated. S-201 datasets cannot be broken apart into division beyond those established by the authoritative source for liability reasons.

**Ordinary Sequence**:

  1. The AtoN status indication information is requested from the service.
  2. The service directly answers the request with the appropriate data. These include the S-201 AtoN status indication features of the data product, but  not necessarily the design state AtoN information.
  3. The data is rendered and displayed to the user.

**Post-conditions**: The correct AtoN status indication information is displayed.

#### Use-case #3

**Name**: Report AtoN status change from a third-party AtoN owner to the AtoN Authority

**Description**: An AtoN owner/operator under permit reports a fault, temporary change or maintenance of one of its AtoN to the national AtoN Authority as structured S-201 data. Examples: a port authority, a bridge operator, an offshore wind farm operator or a construction project. The owner thereby meets its legal reporting obligation, and the Authority can update its authoritative dataset and trigger promulgation (S-124 NW, S-125) without manual data entry (only review and approval).

**Actors**: AtoN owner/operator (or its maintenance contractor), AtoN Authority, AtoN information management system, MSI provider

**Frequency of Use**: Event-driven. Triggered by a detected failure (remote monitoring or observation), a planned temporary change under permit, or maintenance work.

**Pre-conditions**: The AtoN is registered with the AtoN Authority and carries an MRN assigned by the Authority. The owner is identified and authenticated, and is authorised to report only on the AtoN it owns. The Authority's service endpoint is known to the owner's system or discoverable in a service registry.

**Ordinary Sequence**:

  1. The owner detects a change in the status of an AtoN, e.g. light extinguished, buoy off station/drifting, AIS AtoN offline.
  2. The owner's system encodes the change as S-201, referencing the AtoN by its MRN, with status, time of occurrence and expected time of maintenance, if known.
  3. The data is pushed to the AtoN Authority's service, with a delivery acknowledgement requested.
  4. The service validates the submission: known MRN, ownership, schema and plausibility. It acknowledges receipt.
  5. The AtoN Authority verifies the change and updates its authoritative dataset. Subscribers are notified, and promulgation is triggered (S-124 navigational warning and/or S-125 status where relevant).
  6. When the AtoN is restored, the owner repeats steps 1–4 with the restored status. The Authority cancels the related warning/status.

**Alternative / Exception Sequence**:

  * The MRN is unknown or not owned by the submitter: the submission is rejected with a reason, and the owner falls back to manual reporting.
  * The service is unavailable: the owner falls back to manual reporting (phone/e-mail/web form). The manual report remains the legal fallback.

**Post-conditions**: The authoritative S-201 dataset reflects the actual status of the AtoN within minutes of the event. A timestamped record of the owner's report and its acknowledgement exists for audit.

#### Use-case #4

**Name**: Submission and approval of planned AtoN changes (permit workflow)

**Description**: A party that needs new, changed or withdrawn AtoN submits the proposed marking to the national AtoN Authority as S-201 data with candidate status. Examples: an offshore wind farm or cable developer, a port expanding its approach, or a construction project needing temporary/permanent marking. The Authority reviews the proposal and approves or amends it, and assigns MRNs. The approved AtoN are then taken into the authoritative dataset when commissioned. This replaces today's free-text applications and lets the approved design flow directly into Notices to Mariners and on to the HO (S-101) without manual data input.

**Actors**: Applicant (future AtoN owner or its consultant), AtoN Authority, AtoN information management system, MSI provider

**Frequency of Use**: Ad hoc. Each establishment, change, relocation or withdrawal of third-party AtoN requires a permit. Volumes are typically high during offshore wind and major infrastructure projects.

**Pre-conditions**: The applicant is identified and authenticated. The proposal is encoded in S-201 using the candidate/planning status values:

* *Candidate* for new AtoN;
* *Candidate for Modification* for changes;
* *Under Removal / Deletion* for withdrawals.

Existing AtoN affected by the proposal are referenced by their MRN.

**Ordinary Sequence**:

  1. The applicant encodes the proposed marking as S-201: position, type, characteristics, operating period (e.g. seasonal or temporary), owner and maintainer. It is submitted to the AtoN Authority's service with an acknowledgement requested.
  2. The service validates the submission (schema, completeness, references to existing AtoN) and acknowledges receipt.
  3. The AtoN Authority reviews the proposal and approves it, or returns it with required amendments (also as S-201). On approval, it assigns MRNs to the new AtoN and records the permit conditions.
  4. The approved AtoN are published in the authoritative dataset with a planned status and an effective date. This enables preliminary notice to mariners and allows the HO and other subscribers to prepare the S-101 update.
  5. On commissioning, the owner confirms establishment (as in Use-case #3). The Authority changes the status to operational, and the change is promulgated.
  6. For temporary marking, the same flow is used for removal at the end of the permitted period.

**Alternative / Exception Sequence**:

  * The proposal is rejected or needs amendment: the Authority returns it with reasons, and the applicant resubmits.
  * The project is cancelled: the candidate features are withdrawn and never become authoritative.

**Post-conditions**:

* Approved AtoN exist in the authoritative dataset with Authority-assigned MRNs before they are physically established.
* The owner, the Authority and downstream producers (NtM/S-125, HO/S-101) all work from the same structured description.
* The permit record links to the AtoN by MRN.