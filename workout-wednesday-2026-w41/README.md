# **Stripe Chart using Native Column Chart**
Workout Wednesday 2026 Week 41 | Power BI

### 📌 เกี่ยวกับโปรเจกต์
โปรเจกต์นี้เป็นการทำตามโจทย์ Workout Wednesday 2026 Week 41: Power BI Stripe Chart using Native Column Chart โดย Santhanalakshmi Ponnurasan

เป้าหมายคือสร้าง Stripe Chart (หรือ "Warming Stripes") โดยใช้แค่ visual มาตรฐานของ Power BI ไม่ต้องพึ่ง custom visual

### 📂 ข้อมูล
อุณหภูมิเฉลี่ยโลกปี 1880–2025 เทียบกับค่าเฉลี่ยปี 1951–1980 (Temperature Anomaly ตั้งแต่ -0.49 ถึง 1.29 °C) 
Dataset: https://www.workout-wednesday.com/2026-week-41-power-bi-stripe-chart-using-native-column-chart/

### 🛠️ ขั้นตอนการทำงาน
1. ใช้ Clustered Column Chart โดยใส่ Year ที่แกน X
2. สร้าง measure Stripe Height ให้ทุกปีมีความสูงเท่ากัน → แท่งทุกแท่งกลายเป็น "แถบ"
3. ลด gap ระหว่างแท่งเป็น 0% และซ่อนแกน Y
4. ใช้ Conditional Formatting (Diverging color scale) สีแท่งตาม Temp Anomaly
🔵 ฟ้า = ต่ำกว่าค่าเฉลี่ย
⚪ ขาว = ใกล้ค่าเฉลี่ย (0)
🔴 แดง = สูงกว่าค่าเฉลี่ย
5. เพิ่ม Textbox อธิบายว่า Stripe Chart คืออะไรและอ่านอย่างไร

### 💡 Insights
แถบเปลี่ยนจากโทนฟ้าช่วงต้นศตวรรษ 20 ไปเป็นแดงเข้มขึ้นเรื่อย ๆ หลังปี 1980 สะท้อนแนวโน้มโลกร้อนอย่างชัดเจน
