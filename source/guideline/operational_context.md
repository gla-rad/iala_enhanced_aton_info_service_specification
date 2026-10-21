\pagebreak

# Operational Context {#sec:operational_context}

This section describes the context of the service from an operational perspective.

## Pre S-201 Operational Context {#sec:pres_201_operational_context}

This service specification describes the mechanism in which AtoN authorities exchange the relevant AtoN information with other authorities within their area of responsibility, as well as internationally. Typically a national AtoN authority is entrusted with three main responsibilities:

1. Establish, operate and maintain the national AtoN in main routes, through-passages and safe anchorages;
2. Approve and superintend **all** AtoN in the area, including the territorial sea and the EEZ;
3. Be the authoritative source of AtoN information and produce relevant Navigational Warnings (NW)/Notice to Mariners (NtM) when issues occur.

Competent National AtoN Authorities (NAAs) collaborate closely with Local AtoN Authorities (LAAs), within their area of responsibility, (in many cases) exchanging information daily. As a general principle, any entity that creates the need for establishing an AtoN, is also responsible for funding, deploying and maintaining it. This covers ports, bridges, offshore wind farms, offshore installations, cables and pipelines, aquaculture, construction projects etc. Each such AtoN typically needs a permit by the NAA to be established, changed, moved or withdrawn. Owners must report faults **immediately**, and report the final repair as well. As a result, a large share of AtoN information originates *outside* the NAA. Regardless the NAA remains its authoritative source.

 AtoN changes and/or discrepancies are most commonly communicated via NW/NtM, which get published and subsequently appended onto chart corrections, which get more widely distributed. Chart corrections may then also be synchronised with updates on the List-of-Lights (LoL) nautical publications, when necessary. Up until now however, the sharing of AtoN information is quite fragmented, with multiple point-to-point non-interoperable systems, manual steps and long production periods.
 
The end-to-end data sharing between the NAA and the end-users of its AtoN information could take up to several months. The list of end-users includes, but is not necessarily limited to:

* HOs
* Maintenance Companies/Contractors
* VTS (AtoN & Bathymetry)
* Requests for LoL information (including unlighted AtoN – mostly software charts/ECS) - Current electronic publications not in useful formats
* Port Authorities managing areas
* Port Captains
* Civil Aviation Authorities (interested mainly in land-based AtoN)
* MRCC

Requests for AtoN information are coming weekly. Even in the cases where certain AtoN authorities have progressed with their digitalisation efforts by introducing automated data-sharing mechanisms, the employed systems are primarily based on non-standardised data structures. In addition, multiple levels of data access are employed to control the dissemination of information. This complicates the operation and makes it harder to administer it. Overall, the exchange of AtoN information involves the functions shown in [@tbl:naa_pres_operational_functions], many of which are typically supported by digital services.

| Function Name | Function Description |
| --- | --- |
| AtoN Provision | In line with IALA definition [@cite:iala-dict-2023}], competent AtoN authorities' mission is to deliver a reliable, efficient and cost-effective aids to navigation service for the benefit and safety of all mariners. |
| AtoN Maintenance | AtoN belonging to the competent authorities are serviced from operations centres and by inspection vessels. Third-party AtoN are maintained by the owners or their contractors. |
| AtoN Register | The NAA typically maintains an AtoN register and is considered as the authoritative source for all AtoN information in its area of responsibility. |
| Status reports | LAAs, mariners, pilots, as well as the competent authority's own field staff report by phone, e-mail or web form. Usually the NAA reviews the reports manually. |
| NW/NtM Production | NAAs may produce Navigational Warnings (NW) and Notice to Mariners (NtM), promulgated via NAVTEX, VHF, web, APIs, or a daily bulletin via mailing lists. |
| AtoN design-state to HO | Changes are passed to the HO  for ENC correction, typically without a standardised API-based data exchange. |

: The typical functions of a National AtoN Authority. {#tbl:naa_pres_operational_functions}

## Envisioned Operational Context {#sec:envisioned_operational_context}

A standardized AtoN data format would enable compatible systems to exchange AtoN information seamlessly. Each AtoN authority may operate a different AtoN information management system. This system however, should be able to automatically propagate AtoN information from the authoritative source, for use by other national and local authorities (e.g. maritime authorities, harbour and port authorities), as well as making it available to maintenance providers and commercial contractors, or potentially even the public. 

AtoN authorities administer and publish local AtoN data, for their area of responsibility. Typically this includes areas within that state’s exclusive economic zone. Where appropriate they should coordinate with adjacent or overlapping AtoN authorities who share responsibility within the same waterway (e.g. Both the U.S. Coast Guard and Canadian Coast Guard maintain aids to navigation within the waterways comprising the Great Lakes.). The service instance descriptions will provide detailed information of coverage area available to users.

![Example of the AtoN information flow, as per [@cite:iala-ms2].](../../resources/AtoNInfoDistribution.png){#fig:ms2_aton_information_flow}

This service specification defines the exchange of enhanced AtoN information using S-201 between a service provider and the end-user of such a service. In line with the IALA interpretation of the IMO *MS-2 Aids to Navigation* maritime service [@cite:iala-ms2], as illustrated in [@fig:ms2_aton_information_flow], the end-user may be a member of staff of another AtoN authority or a HO. The S-201 data product has been specifically designed for that purpose and may contain sensitive maintenance information that should **not** be made available to external parties. Therefore, it is strongly advised that the described service limits the AtoN information details shared outside the circle of authorities shown in [@fig:ms2_aton_information_flow]. Each AtoN authority should decide the level of detail to be included in the published S-201 datasets and control access to it by the relevant end-users. At a minimum we need to populate the data available to the mariners through S-101.

Depending on the specific use case requirements, the service usage patterns may differ. For example, a HO could pull all available data and subscribe to updates from a data producer (e.g. NAA) and redistribute the data to the RENCs via S-101 and S-125 (after applying validation checks or optimising the data for a specific group of end-users). The orchestration of multiple AtoN information services in the distribution chain, however, is not in the scope of this document and lies within the responsibility of the service provider(s).

### Relationships between S-201 and S-101, S-124, S-125 {#sec:relationship_124_s125_s201}

IHO has produced guidance on the interoperability between S-201 and the S-101, S-124, S-125 data product specifications [@cite:iho-s125-interoperability-guide]. For more information please refer the IHO document.

### Discoverability and Dissemination {#sec:discoverability_and_dissemination}

The S-201 data should be discoverable **only** by HO, maritime authorities and other relevant authorised organisations. However, discoverability should be make possible through a dynamic mechanism to allow the automatic recovery after any potential availability incidents. S-201 data exchange may also enhance S-101 ENC, S-124 NW and S-125 AtoN digital services, by reducing the effort of the data mapping process, through the harmonization of data models.

### Portrayal {#sec:portrayal}

The described service is intended for data exchange but it also allow for portrayal of the data to assist the management of the AtoN information by the shore-based staff.

## Functional and Non-functional Requirements {#sec:functional_non_functional_reqs}

The table below defines the functional requirements, as they are defined in the IALA documentation for the IMO MS-2 Aids to Navigation Maritime Service [@cite:iala-ms2]. Please note that the feature identifiers referenced in [@tbl:ms2-functional-requirements], are also referring to service features identified in the IALA MS-2 specification document.

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
| **Functional** | MS2-FR012 | Information Filtering | The end users should be able to filter the relevant AtoN information by name or based on a point, line, polygon geometry after this been received. | F008 |
| **Functional** | MS2-FR013 | Delivery Acknowledgement Request | The service is able to request a data delivery acknowledgement for any end-user. The requested acknowledgement should support multiple levels (receiving, reading etc.) | F011 |
| **Functional** | MS2-FR014 | Delivery Acknowledgement Confirmation | The service provides a common but secure facility for all end-users to acknowledge the successful updates of AtoN information if requested. | F011 |
| **Functional** | MS2-FR015 | Subscription Updates | The service is able to identify and contact the subscribed end-users to push updates on the requested dataset(s). | F012 |
| **Functional** | MS2-FR016 | Input Automation | The service updates the advertised datasets, based on the AtoN status updates received, including S-201 data (status changes, planned AtoN) received from authorised submitters such as AtoN owners, applicants and maintenance providers. | F013 |
| **Functional** | MS2-FR017 | Change Log | The service allows data producers to track the record of changes to the advertised dataset(s) for any time interval required. | F015 |
| **Functional** | MS2-FR018 | Change Log State | The service allows data producers to view the full state of the AtoN Information as provided to consumers at any past point in time. | F015 |
| **Functional** | MS2-FR019 | Validation feedback | Each submission is validated (schema, known MRN, submitter's responsibility for the AtoN) and accepted or rejected with a reason. | UC #6, #7 |
| **Functional** | MS2-FR020 | Persistent identification | Each AtoN is identified by an MRN assigned by the AtoN authority. The MRN is stable across dataset editions and is reusable in S-101, S-124 and S-125. | Lesson 1 |
| **Functional** | MS2-FR021 | Multilingual text | Free-text information can be provided in the national language and English. | DK practice (Danish/English) |

: Functional Requirements for the MS-2 – Aids to Navigation  Service. {#tbl:ms2-functional-requirements}

The table below defines non-functional requirements for the S-201 service, as they are defined in the IALA documentation for the IMO MS-2 Aids to Navigation Maritime Service [@cite:iala-ms2]. Please note that the feature identifiers referenced in [@tbl:ms2-non-functional-requirements], are also referring to service features identified in the IALA MS-2 specification document.

| Requirement Type | Requirement ID | Requirement Name | Requirement Text | Feature Identifier |
| --- | --- | --- | --- | --- |
| **Non-functional** | MS2-NFR001 | Authorization | Service consumers are authorized by the provider for reception of data by the service. This may be public authorization (everyone has access), or limited authorization associated with a transactional service | F010, F016, F017 |
| **Non-functional** | MS2-NFR002 | Authenticity | Service consumers can verify independently the authenticity of the AtoN information transmitted to them. | F006, F009 |
| **Non-functional** | MS2-NFR003 | Integrity | It is clear to both service provider and consumer whether changes have been made to the AtoN information after this was created. | F006, F009 |
| **Non-functional** | MS2-NFR004 | Availability | The service is consistently available in its ability to deliver AtoN Information to its consumers. (i.e. Service should have a high availability). This should be consistent with the policies of each authority. | F001, F002, F004, F005, F011, F013 |
| **Non-functional** | MS2-NFR005 | Responsiveness | The service provides a response to a service consumer’s request without delay, and the data provided should be (near) real time. | F001, F002, F011, F016 |
| **Non-functional** | MS2-NFR006 | Performance | The service can handle multiple requests simultaneously (e.g. 1000/sec). | F001, F010, F012 |
| **Non-functional** | MS2-NFR007 | Portability | The service makes the data available in portable machine-readable formats (e.g. XML/JSON) | F014 |
| **Non-functional** | MS2-NFR008 | Compression | The service is able transmit the data in compressed format, with the compression method (e.g., gzip) clearly indicated. | F001, F005, F008 |
| **Non-functional** | MS2-NFR009 | Accessibility | The AtoN information is accessible as much as possible and modern APIs should be supported for machine-to-machine communication. | F005, F010, F013, F014 |
| **Non-functional** | MS2-NFR010 | Compatibility | The service is compatible with as many end-user devices as possible and conforms to the latest relevant maritime standards (e.g. IEC 63173-2 (SECOM), S-100 (S-124, S-125, S-201, S-240)) | F005, F010, F013, F014 |
| **Non-functional** | MS2-NFR011 | Scoped authorisation | Authorisation can be scoped to the AtoN or area a consumer or submitter is responsible for, not only "public" or "authority". | UC #6, #7 |
| **Non-functional** | MS2-NFR012 | Auditability of inputs | All received submissions and acknowledgements are logged with submitter, time and content. This extends Change Log / Change Log State to inbound data. | UC #6 |
| **Non-functional** | MS2-NFR013 | Fallback | Unavailability of the service must not prevent reporting through established manual channels. Re-synchronisation after recovery is supported. | UC #6 |

: Non-Functional Requirements for the MS-2 – Aids to Navigation Service. {#tbl:ms2-non-functional-requirements}

## Other Constraints {#sec:other_constraints}

### Relevant Industrial Standards {#sec:relevant_industrial_standards}

Not Applicable

### Operational Nodes {#sec:operational_nodes}

The following tables describe the operational nodes of the service.

| Operational Node | Remarks |
| --- | --- |
| ***AtoN Authority – AtoN Information Management System*** | The AtoN Information Management System collects all AtoN Information available from its Authoritative Source (AtoN Administration). |
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

**Name**: Retrieve AtoN information for charting by a Hydrographic Office

**Description**: Retrieve and portray changes on the design state of AtoN for charting. 70% of the chart changes a cartographer has to make are linked to AtoN changes.

**Actors**: AtoN information service, Hydrographic Office

**Frequency of Use**: Ad-hoc, typically triggered upon an update request by the Hydrographic Office

**Pre-conditions**: The service instance is known to the relevant system or has access to a service registry in which the service instance can be discovered. Data is packaged in S-201 datasets with MRN attributes populated. S-201 datasets cannot be broken apart into division beyond those established by the authoritative source for liability reasons.

**Ordinary Sequence**:

  1. The AtoN status indication information is requested from the service.
  2. The service directly answers the request with the appropriate data. These include the S-201 AtoN status indication features of the data product, but  not necessarily the design state AtoN information.
  3. The data is rendered and displayed to the user.

**Post-conditions**: The correct AtoN status indication information is displayed.

#### Use-case #2

**Name**: Retrieve AtoN information for charting by an ECS Provider

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

**Name**: Share information with maintenance providers

#### Use-case #4

**Name**: General inquiry searching for AtoN information – e.g. doing research. Need to use a lower detail for that – S-201 seems to be in line with INSPIRE standards.

#### Use-case #5

**Name**: Missing buoys

#### Use-case #6

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

#### Use-case #7

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
  5. On commissioning, the owner confirms establishment (as in Use-case #6). The Authority changes the status to operational, and the change is promulgated.
  6. For temporary marking, the same flow is used for removal at the end of the permitted period.

**Alternative / Exception Sequence**:

  * The proposal is rejected or needs amendment: the Authority returns it with reasons, and the applicant resubmits.
  * The project is cancelled: the candidate features are withdrawn and never become authoritative.

**Post-conditions**:

* Approved AtoN exist in the authoritative dataset with Authority-assigned MRNs before they are physically established.
* The owner, the Authority and downstream producers (NtM/S-125, HO/S-101) all work from the same structured description.
* The permit record links to the AtoN by MRN.