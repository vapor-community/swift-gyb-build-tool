# Security Policy

## Supported Versions

Use this section to tell people about which versions of your project are
currently being supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.x   | :x:                |

## Private Disclosure Process

The Vapor Core Team ask that known and suspected vulnerabilities be privately and responsibly disclosed by emailing [security@vapor.codes](security@vapor.codes) or message one of the Core team on [Discord](http://vapor.team) with the all the required detail.

**Do not file a public issue.**

### When to report a vulnerability

* You think you have discovered a potential security vulnerability in a Vapor package.
* You are unsure how a vulnerability affects a Vapor package.

### What happens next?

* A member of the team will acknowledge receipt of the report within 3 working days. This may include a request for additional information about reproducing the vulnerability.
* We will privately inform the Swift Server Work Group ([SSWG](https://github.com/swift-server/sswg)) of the vulnerability within 10 days of the report as per their [security guidelines](https://github.com/swift-server/sswg/blob/main/security/README.md).
* Once we have identified a fix we may ask you to validate it. We aim to do this within 30 days. In some cases this may not be possible, for example when the vulnerability exists at the protocol level and the industry must coordinate on the disclosure process.
* If a CVE number is required, one will be requested through the [GitHub security advisory process](https://docs.github.com/en/code-security/security-advisories), providing you with full credit for the discovery.
* We will decide on a planned release date and let you know when it is.
* Prior to release, we will inform major dependents that a security-related patch is impending.
* Once the fix has been released we will publish a security advisory on GitHub and in the Server → Security Updates category on the [Swift forums](https://forums.swift.org/c/server/security-updates/).
