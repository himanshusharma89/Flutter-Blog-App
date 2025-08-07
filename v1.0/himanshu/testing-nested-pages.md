---
type: page
title: Testing Nested Pages
listed: true
slug: testing-nested-pages
description: 
index_title: Testing Nested Pages
hidden: 
keywords: 
tags: 
---


Platform9's %product_name% is an enterprise private cloud platform that enables IT & DevOps administrator to manage their virtualized and Kubernetes infrastructure at scale while leveraging their existing investments in storage and server hardware.

%product_name% is built using open source KVM hypervisor behind the scenes. It uses a combination of best of breed open source technologies for virtualization and container management, along with our unique features to provide a familiar experience to virtualization and container administrators along with all enterprise capabilities required to build, maintain and scale private clouds.

%product_name% has been designed with these design principles:

## Design Principles

### Open Architecture

Given recent developments in the Virtualization space, we believe that enterprises must retain strategic optionality on critical infrastructure technologies.  No single vendor should retain so much lock-in that business can be held to ransom because of switching costs and complexities.

We believe that the only way of achieving this is by relying on open-source technologies that have broader industry adoption, giving users the flexibility to multi-source solutions over time.

For this reason, %product_name% is based on open-source technologies, including the KVM Hypervisor, OpenStack components, the Open Virtual Network project, and the Kubernetes ecosystem.  These APIs can be used natively, without modification, and via all available SDK tooling that is upstream and version compatible.

### Integration and Interoperability with Existing Hardware

We aim to be broadly compatible with all major server, storage and network investments in use by enterprises.

We believe that one of the core value propositions of private clouds is that for most businesses, there are existing hardware investments, of diverse makes and generations. Often, this hardware is partially depreciated, reducing the operational costs of using that hardware.

We strive to allow our customers to _sweat_ their existing hardware assets, and to do so, we prioritize interoperability and a wide HCL. We strive for our HCL to include all Enterprise Linux compatible hardware, and will degrade features gracefully when niche hardware capabilities are unavailable.

### Drop-in Replacement for Enterprise VMware Features

Our goal is to enable enterprises with the best private cloud platform that is feature rich with all key enterprise virtualization features that they have known and relied on for decades. For users transitioning from VMware, read [auto$](/private-cloud-director/transition-from-vmware) for a glossary of commonly used VMware features, and their alternatives in %product_name%.

### Opinionated Design and UX

We are inspired by beautiful products, elegantly designed, and that simplify operations for end users.  While being based on powerful open-source technologies, we want to make these technologies simpler to learn, simpler to deploy, and simpler to operate at scale.

%product_name% will strive to simplify cloud operations and management for IT and platform engineering teams, while ensuring critical control elements are available.

For instance, to provide the best possible experience, we may abstract away lower level APIs and controls in the underlying technology to provide a higher level abstraction.  At other times, we may make simplifying assumptions that reduce semantic complexity.

This opinionated design will be done in a manner that retains upstream API compatibility; but we may introduce additional APIs - via composition - to support our design philosophy.

We design for IT operations teams  and platform engineering teams as the Administrator user, who will then  optionally invite other administrator users; as well as DevOps teams and  developer teams as self-service users.

### Curated Technologies

Open-source projects vary widely in their maturity and readiness for enterprise usage.  We will select projects and technologies with a view to ensure the following, in priority order:

1. Projects that can help us deliver a deterministic, highly available experience that enterprises can depend upon (when used with our proactive operations model)
2. Projects that have broader customer interest, vendor participation and that are not single vendor technologies
3. Projects that have either achieved maturity or are likely to achieve maturity due to growing contributor base

### Cloud Completeness via Extensions

A long standing challenge with private clouds has been that they lack the breadth of features that are available from public cloud providers.  We are clear eyed about the amount of effort required to match hyperscale public clouds in features and services; yet, we are ambitious about making private clouds competitive and more attractive for developers.

Our approach to achieving Cloud Completeness will be to build base platform features, such as critical Infrastructure-as-a-service features, and to leverage the ecosystem of open-source technologies, such as Kubernetes operators, to enable a wider range of higher level application services.

