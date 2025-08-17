# Smart Traffic Light Controller 🚦

**Course:** CMPEN 270 – Digital Design  
**Author:** Sadid Hassan  
**Date:** April 2025  

> ⚡ **Note:** This README is a condensed version of my full project submission.  
> It highlights the state machine design, logic derivation, and demonstration.  

---

## 📝 Project Overview
A finite state machine (FSM) traffic light controller with the following specs:
- **Nominal timing (8 states):**  
  - Green: 62.5% of cycle (5 states)  
  - Yellow: 12.5% of cycle (1 state)  
  - Red: 25% of cycle (2 states)  
- **Early-change override:** If a car is detected on the side street during green, the controller jumps to **Yellow**, then continues through Red → Green.

---

## 🔧 Tools & Implementation
- **Logic Elements:** JK flip-flops, AND/OR gates, inverter  
- **Design Method:** State diagram, state table, K-maps, logic equations  
- **Testing:** EDAPlayground Verilog simulation + breadboard demonstration  

---

## 📊 State Machine Design

### State Diagram
![State Diagram](images/STATETABLEDP3.jpg)

### State Table
![State Table](images/STATETABLEDP3.jpg)

---

## 🧮 K-Maps & Output Logic

### Green Output  
`G = ~Q2 + (~Q1 · ~Q0)`  

### Yellow Output  
`Y = Q2 · ~Q1 · Q0`  

### Red Output  
`R = Q2 · Q1`  

![K-Maps](images/kmapsDP3.jpg)


---

## 🖥️ Verilog Implementation

- `traffic_light_controller.v` — FSM module  
- `tb_traffic_light_controller.v` — Testbench for EDAPlayground  

*(See repo `rtl/` and `tb/` folders for code)*  

> 💡 *Note: The Verilog implementation was not part of the original assignment.  
> I added it on my own to experiment with hardware simulation and EDAPlayground.*  

---

## 🎥 Output Demonstration Video
[▶️ Watch Demonstration](link-to-video)  
*(System tested by toggling `car_detect` input and observing LED outputs for Green(OUT2), Yellow(OUT1), and Red states(OUT0).)*

---

## ✅ Results & Learnings
- Designed and validated a working FSM controller that satisfied both normal timing and car-detect override.  
- Verified correctness using both simulation and physical demonstration.  
- Strengthened skills in **FSM design, sequential logic, K-map minimization, and debugging hardware prototypes.**  

---
