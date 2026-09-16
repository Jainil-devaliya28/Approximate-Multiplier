# LSHIM: Low-Power and Small-Area Inexact Multiplier for High-Speed Error-Resilient Applications

**Department of Electrical Engineering, Indian Institute of Technology Gandhinagar**

---

## Overview

LSHIM is a novel **approximate multiplier** architecture designed to reduce power consumption, hardware area, and computation latency at the cost of a small, well-characterized error — making it well suited for error-resilient applications such as image processing, machine learning, and digital signal processing (DSP).

In many real-world workloads, perfect multiplication accuracy is unnecessary. Approximate computing exploits this by trading a bounded amount of accuracy for significant gains in speed, area, and energy efficiency, which is especially valuable for battery-powered and resource-constrained systems like IoT nodes, smartphones, and wearables.

### Why replace traditional (exact) multipliers?
- High power usage
- Large hardware area due to circuit complexity
- Slower execution time
- These combine to bottleneck performance in modern embedded systems

---

## Background: Existing Approximate Multipliers

**Mitchell's Approximate Multiplier**
- Based on logarithmic approximation
- Fast and compact, but suffers from high error (MRED)

**Other prior work:** ALM-SOA, REALM, HEALM, IALM — these improve accuracy but require more power and area, illustrating the classic accuracy-vs-resource tradeoff that LSHIM aims to improve upon.

---

## Proposed Multiplier: LSHIM

LSHIM optimizes **power, speed, and area simultaneously while keeping error minimal.**

**Key features:**
- Uses a priority encoder (rather than a leading-one detector) for more efficient bit-position detection
- Custom result production unit
- Truncates the final term for faster computation
- Combines shifts, multiplexers (MUXes), and logic efficiently

### Algorithm

Given `A, B`: n-bit inputs, `R`: 2n-bit approximate result

1. Represent operands in normalized form: `N = 2^k(1 + x) → N − 2^k·x = 2^k·x`, giving `A = 2^ka(1 + xa)`, `B = 2^kb(1 + xb)`
2. Compute `P = A × B`
3. Calculate `ka`: priority-encode A
4. Calculate `kb`: priority-encode B
5. Calculate `Xa`: shift A left by `kb` bits
6. Calculate `Xb`: shift B left by `ka` bits
7. Calculate `k = ka + kb`
8. Calculate `S = Xa + Xb`
9. If `S[k] = '0'`, then `O_MUX = {S[k], S[k−1:k−3]}`
10. Else, `O_MUX = {S[k−1:k−4]}`
11. Calculate result `R`: concatenate `{S[k], O_MUX, 27'b1}`, right-shifted by `(30 − k)`

This flow combines a priority encoder, shifters, an adder, and a MUX-based result production unit to approximate the multiplication with reduced hardware complexity.

---

## Design Component Comparison: Leading One Detector vs. Priority Encoder

| Metric | Leading One Detector | Priority Encoder |
|---|---|---|
| Dynamic Power | 1.204 W | 0.313 W |
| Static Power | 0.073 W | 0.071 W |
| Data Path Delay | 6.626 ns | 6.275 ns |
| Slice LUT | 15 | 10 |
| Slice Register | 0 | 3 |

The priority encoder was chosen for LSHIM's front end due to its clear advantages in power and area over a leading-one detector.

---

## Simulation and Verification

The design was verified via functional simulation (waveform-based testing of inputs `A`, `B` and output `O`) to confirm correct approximate-multiplication behavior across test vectors, including both the `S[k] = 0` and `S[k] = 1` branches of the algorithm (see worked examples in the report/poster).

---

## Performance Comparison

| Metric | Exact Multiplier | Mitchell Multiplier | Proposed LSHIM Multiplier |
|---|---|---|---|
| Dynamic Power | 39.984 W | 21.099 W | **6.200 W** |
| Static Power | 0.485 W | 0.485 W | **0.097 W** |
| Data Path Delay | 27.634 ns | 13.325 ns | 24.161 ns |
| Slice LUT | 361 | 173 | 274 |
| Slice Register | 0 | 0 | 6 |

## Error Analysis

| Metric | Mitchell Multiplier | Proposed LSHIM Multiplier |
|---|---|---|
| Worst Case Error | 11.11% | 11.10% |
| Best Case Error | 0% | 0% |
| MRED (Mean Relative Error Distance) | 3.85% | **2.90%** |
| NMED (Normalized Mean Error Distance) | 3.70% | **2.73%** |

---

## Application: Image Processing (Gaussian Blur)

To demonstrate real-world viability, each pixel of a test image was convolved with a 3×3 Gaussian kernel, replacing the standard multiplication operation with the LSHIM approximate multiplier.

- Despite reduced computational precision, visual quality was preserved
- The system achieved significant savings in power and area
- Results confirm LSHIM is well-suited for image processing applications, where slight inaccuracies are perceptually negligible

**Quality metrics (LSHIM-based blur vs. accurate-multiplier blur):**
- **SSIM:** 0.9437
- **PSNR:** 33.40 dB

---

## Conclusion

LSHIM achieves an excellent balance between performance and accuracy, making it a compelling choice for error-resilient applications. Compared to a traditional exact multiplier, it delivers:

- **31.7%** reduction in area
- **84.43%** decrease in power consumption
- **36.1%** faster operation
- **2.9%** Mean Relative Error Distance (MRED)

These results make LSHIM ideal for real-world systems where minor errors are acceptable in exchange for significant gains in speed, size, and energy efficiency.

---



