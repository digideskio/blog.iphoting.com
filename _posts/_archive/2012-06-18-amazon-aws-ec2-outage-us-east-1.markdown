---
layout: post
title: "Amazon AWS EC2 Outage (us-east-1)"
date: 2012-06-18 17:50
comments: true
categories: 
- AWS
- EC2
- outage
---
[AWS Status Page][status]:

> 12:15 AM PDT We would like to share some detail about the Amazon Elastic Compute Cloud (EC2) service event last night when power was lost to some EC2 instances and Amazon Elastic Block Store (EBS) volumes in a single Availability Zone in the US East Region. 

> At approximately 8:44PM PDT, there was a cable fault in the high voltage Utility power distribution system. Two Utility substations that feed the impacted Availability Zone went offline, causing the entire Availability Zone to fail over to generator power. All EC2 instances and EBS volumes successfully transferred to back-up generator power. At 8:53PM PDT, one of the generators overheated and powered off because of a defective cooling fan. At this point, the EC2 instances and EBS volumes supported by this generator failed over to their secondary back-up power (which is provided by a completely separate power distribution circuit complete with additional generator capacity). Unfortunately, one of the breakers on this particular back-up power distribution circuit was incorrectly configured to open at too low a power threshold and opened when the load transferred to this circuit. After this circuit breaker opened at 8:57PM PDT, the affected instances and volumes were left without primary, back-up, or secondary back-up power. Those customers with affected instances or volumes that were running in multi-Availability Zone configurations avoided meaningful disruption to their applications; however, those affected who were only running in this Availability Zone, had to wait until the power was restored to be fully functional. 

> The generator fan was fixed and the generator was restarted at 10:19PM PDT. Once power was restored, affected instances and volumes began to recover, with the majority of instances recovering by 10:50PM PDT. For EBS volumes (including boot volumes) that had inflight writes at the time of the power loss, those volumes had the potential to be in an inconsistent state. Rather than return those volumes in a potentially inconsistent state, EBS brings them back online in an impaired state where all I/O on the volume is paused. Customers can then verify the volume is consistent and resume using it. By 1:05AM PDT, over 99% of affected volumes had been returned to customers with a state 'impaired' and paused I/O to the instance. 

> Separate from the impact to the instances and volumes, the EBS-related EC2 API calls were impaired from 8:57PM PDT until 10:40PM PDT. Specifically, during this time period, mutable EBS calls (e.g. create, delete) were failing. This also affected the ability for customers to launch new EBS-backed EC2 instances. The EC2 and EBS APIs are implemented on multi-Availability Zone replicated datastores. The EBS datastore is used to store metadata for resources such as volumes and snapshots. One of the primary EBS datastores lost power because of the event. The datastore that lost power did not fail cleanly, leaving the system unable to flip the datastore to its replicas in another Availability Zone. To protect against datastore corruption, the system automatically flipped to read-only mode until power was restored to the affected Availability Zone. Once power was restored, we were able to get back into a consistent state and returned the datastore to read-write mode, which enabled the mutable EBS calls to succeed. We will be implementing changes to our replication to ensure that our datastores are not able to get into the state that prevented rapid failover. 

> Utility power has since been restored and all instances and volumes are now running with full power redundancy. We have also completed an audit of all our back-up power distribution circuits. We found one additional breaker that needed corrective action. We've now validated that all breakers worldwide are properly configured, and are incorporating these configuration checks into our regular testing and audit processes. 

> We sincerely apologize for the inconvenience to those who were impacted by the event.

Moral of the story: use multi-AZ deployment or multiple cloud providers.

[status]: http://status.aws.amazon.com/
