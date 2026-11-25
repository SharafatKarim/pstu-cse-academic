# Campus Network Subnetting & IP Address Plan

> **Physical Hardware Lab Implementation:** MikroTik RouterOS Core, Cisco ISR 4321 Distribution Router & Cisco Catalyst MLS

---

## 1. Complete IP Address Calculation Table

| Segment / Role | VLAN | Prefix | Network Addr | Subnet Mask | Wildcard | Usable Host Range | Broadcast | Usable Hosts |
| :--- | :---: | :---: | :--- | :--- | :--- | :--- | :--- | :---: |
| **MLS-CSE Student** | 10 | `/21` | `192.168.0.0` | `255.255.248.0` | `0.0.7.255` | `192.168.0.1 – 192.168.7.254` | `192.168.7.255` | 2046 |
| **MLS-CSE Teacher** | 20 | `/22` | `192.168.24.0` | `255.255.252.0` | `0.0.3.255` | `192.168.24.1 – 192.168.27.254` | `192.168.27.255` | 1022 |
| **MLS-CSE Academic** | 30 | `/23` | `192.168.36.0` | `255.255.254.0` | `0.0.1.255` | `192.168.36.1 – 192.168.37.254` | `192.168.37.255` | 510 |
| **MLS-BBA Student** | 10 | `/21` | `192.168.8.0` | `255.255.248.0` | `0.0.7.255` | `192.168.8.1 – 192.168.15.254` | `192.168.15.255` | 2046 |
| **MLS-BBA Teacher** | 20 | `/22` | `192.168.28.0` | `255.255.252.0` | `0.0.3.255` | `192.168.28.1 – 192.168.31.254` | `192.168.31.255` | 1022 |
| **MLS-BBA Academic** | 30 | `/23` | `192.168.38.0` | `255.255.254.0` | `0.0.1.255` | `192.168.38.1 – 192.168.39.254` | `192.168.39.255` | 510 |
| **MLS-NFS Student** | 10 | `/21` | `192.168.16.0` | `255.255.248.0` | `0.0.7.255` | `192.168.16.1 – 192.168.23.254` | `192.168.23.255` | 2046 |
| **MLS-NFS Teacher** | 20 | `/22` | `192.168.32.0` | `255.255.252.0` | `0.0.3.255` | `192.168.32.1 – 192.168.35.254` | `192.168.35.255` | 1022 |
| **MLS-NFS Academic** | 30 | `/23` | `192.168.40.0` | `255.255.254.0` | `0.0.1.255` | `192.168.40.1 – 192.168.41.254` | `192.168.41.255` | 510 |
| **DIST -- MLS-CSE** | N/A | `/29` | `192.168.42.0` | `255.255.255.248` | `0.0.0.7` | `192.168.42.1 – 192.168.42.6` | `192.168.42.7` | 6 |
| **DIST -- MLS-BBA** | N/A | `/29` | `192.168.42.8` | `255.255.255.248` | `0.0.0.7` | `192.168.42.9 – 192.168.42.14` | `192.168.42.15` | 6 |
| **DIST -- MLS-NFS** | N/A | `/29` | `192.168.42.16` | `255.255.255.248` | `0.0.0.7` | `192.168.42.17 – 192.168.42.22` | `192.168.42.23` | 6 |
| **Core -- DIST Link** | N/A | `/24` | `103.133.254.0` | `255.255.255.0` | `0.0.0.255` | `103.133.254.1 – 103.133.254.254` | `103.133.254.255` | 254 |

---

## 2. Device Interface IP Assignments

| Device | Interface | IP Address | OSPF Area | Description |
| :--- | :--- | :--- | :---: | :--- |
| **Core Router (MikroTik)** | `sfp2` (`to-DIST`) | `103.133.254.2/24` | 0 (Backbone) | Interconnect to Dist Router & Campus DNS Resolver |
| **DIST Router (Cisco 4321)** | `GigabitEthernet0/0/0` | `103.133.254.1/24` | 0 (Backbone) | Uplink to Core Router (MikroTik) |
| **DIST Router (Cisco 4321)** | `GigabitEthernet0/0/1` | `192.168.42.1/29` | 0 | Downlink to MLS-CSE |
| **MLS-CSE** | `GigabitEthernet1/0/1` | `192.168.42.2/29` | 0 | Uplink to DIST Router (`no switchport`) |
| **MLS-CSE** | `Vlan 10` | `192.168.0.1/21` | 0 | Default Gateway (`Student`) |
| **MLS-CSE** | `Vlan 20` | `192.168.24.1/22` | 0 | Default Gateway (`Teacher`) |
| **MLS-CSE** | `Vlan 30` | `192.168.36.1/23` | 0 | Default Gateway (`Academic`) |
| **MLS-BBA (Planned)** | `GigabitEthernet1/0/1` | `192.168.42.10/29` | 1 | Uplink to DIST Router (`no switchport`) |
| **MLS-BBA (Planned)** | `Vlan 10` | `192.168.8.1/21` | 1 | Default Gateway (`Student`) |
| **MLS-BBA (Planned)** | `Vlan 20` | `192.168.28.1/22` | 1 | Default Gateway (`Teacher`) |
| **MLS-BBA (Planned)** | `Vlan 30` | `192.168.38.1/23` | 1 | Default Gateway (`Academic`) |
| **MLS-NFS (Planned)** | `GigabitEthernet1/0/1` | `192.168.42.18/29` | 2 | Uplink to DIST Router (`no switchport`) |
| **MLS-NFS (Planned)** | `Vlan 10` | `192.168.16.1/21` | 2 | Default Gateway (`Student`) |
| **MLS-NFS (Planned)** | `Vlan 20` | `192.168.32.1/22` | 2 | Default Gateway (`Teacher`) |
| **MLS-NFS (Planned)** | `Vlan 30` | `192.168.40.1/23` | 2 | Default Gateway (`Academic`) |
| **Internet / Upstream** | DNS Upstream | `8.8.8.8, 1.1.1.1` | N/A | External Public DNS Forwarders |

---

## 3. DHCP Pools & Infrastructure Mapping

| Pool Name | Network / Subnet | Default Gateway | DNS Server |
| :--- | :--- | :--- | :--- |
| **`CSE_STUDENT`** | `192.168.0.0/21` | `192.168.0.1` | `103.133.254.2` |
| **`CSE_TEACHER`** | `192.168.24.0/22` | `192.168.24.1` | `103.133.254.2` |
| **`CSE_ACADEMIC`** | `192.168.36.0/23` | `192.168.36.1` | `103.133.254.2` |
| **`BBA_STUDENT`** | `192.168.8.0/21` | `192.168.8.1` | `103.133.254.2` |
| **`BBA_TEACHER`** | `192.168.28.0/22` | `192.168.28.1` | `103.133.254.2` |
| **`BBA_ACADEMIC`** | `192.168.38.0/23` | `192.168.38.1` | `103.133.254.2` |
| **`NFS_STUDENT`** | `192.168.16.0/21` | `192.168.16.1` | `103.133.254.2` |
| **`NFS_TEACHER`** | `192.168.32.0/22` | `192.168.32.1` | `103.133.254.2` |
| **`NFS_ACADEMIC`** | `192.168.40.0/23` | `192.168.40.1` | `103.133.254.2` |

> **DHCP Excluded Addresses on MLS-CSE:**
> - `192.168.0.1` (SVI Vlan 10)
> - `192.168.24.1` (SVI Vlan 20)
> - `192.168.36.1` (SVI Vlan 30)

---

## 4. OSPF Architecture & Switchport Layout

- **Router IDs:**
  - **Core Router (MikroTik):** `1.2.3.0` (Backbone / Area 0)
  - **Distribution Router (Cisco 4321):** `2.2.2.2` (Area 0)
  - **MLS-CSE (Cisco Catalyst):** `1.1.1.1` (Area 0)
  - **MLS-BBA / MLS-NFS (Planned):** Areas 1 & 2
- **Backbone & Interconnect:**
  - `103.133.254.0/24`: Core MikroTik `sfp2` (`103.133.254.2`) $\leftrightarrow$ Cisco 4321 `Gi0/0/0` (`103.133.254.1`)
  - Static route configured on Cisco 4321: `ip route 192.168.0.0 255.255.0.0 103.133.254.2`
- **MLS-CSE Port Layout:**
  - **Routed Uplink:** `GigabitEthernet 1/0/1` (`no switchport`, `192.168.42.2/29`) $\leftrightarrow$ DIST `Gi0/0/1` (`192.168.42.1/29`)
  - **Student Access (VLAN 10):** `GigabitEthernet 1/0/2 – 1/0/12`
  - **Teacher Access (VLAN 20):** `GigabitEthernet 1/0/13 – 1/0/24`
  - **Academic Access (VLAN 30):** `GigabitEthernet 1/0/25 – 1/0/36`

---

## 5. Remote Access, Services & Verification

- **DNS Services:** Core MikroTik acts as recursive caching DNS server at `103.133.254.2` (`allow-remote-requests=yes`), forwarding to Google (`8.8.8.8`) and Cloudflare (`1.1.1.1`).
- **Remote Access Protocol:** SSHv2 (Port 22), Domain: `campus.edu`, RSA 1024-bit key modulus.
- **Credentials:** Username `admin` / `cisco` (Privilege 15), enable secret `cisco`.
- **Management IPs:**
  - Core Router (MikroTik): `103.133.254.2` (WinBox / SSH)
  - Distribution Router (Cisco 4321): `103.133.254.1` / `192.168.42.1`
  - MLS-CSE: Uplink `192.168.42.2` / SVI `192.168.0.1`
- **Testing & Verification Commands:**
  - **MikroTik Core:**
    ```routeros
    /interface print
    /ping 103.133.254.1 count=4
    /routing ospf neighbor print
    /ip route print where ospf
    /ping 192.168.0.1 count=4
    ```
  - **Cisco Distribution & MLS:**
    ```cisco
    show ip interface brief
    show ip ospf neighbor
    show ip route
    show ip dhcp binding
    ```
