# **What Makes a Movie Successful?**
IMDb Movie Success Analysis | Power BI

### 📌 เกี่ยวกับโปรเจกต์
Dashboard นี้ตั้งคำถามว่า "หนังแบบไหนถึงประสบความสำเร็จ?" โดยเลือกวัดความสำเร็จจาก 2 มุม คือ เรตติ้ง (Rating) และ รายได้ (Revenue) แล้วเปรียบเทียบแยกตามแนวหนัง (Genre)

### 📂 ข้อมูล
- Dataset: https://www.kaggle.com/datasets/PromptCloudHQ/imdb-data
- ฟิลด์หลักที่ใช้: Title, Genre, Year, Rating, Revenue (ล้านดอลลาร์)
- หนังบางเรื่องไม่มีข้อมูลรายได้ จึงสร้าง KPI Revenue Coverage % เพื่อบอกว่ามีข้อมูลรายได้ครอบคลุมกี่ % (87.1%)

### 💡 Insights
1. หนังแนว Drama มีจำนวนมากที่สุด แต่จำนวนมากไม่ได้แปลว่ามีรายได้มากตามไปด้วย — Median Revenue ของ Drama ต่ำกว่าหนังในหลาย ๆ แนว
2. หนังแนว Animation นำทั้งเรตติ้งและรายได้ — Median Revenue สูงสุด (~190) และ Avg Rating สูงกว่า 7.3
3. หนังแนว Adventure และ Action ทำรายได้ดี แต่เรตติ้งอยู่ในระดับกลาง
4. หนังแนว War / Biography มีเรตติ้งสูง แต่รายได้ต่ำ — เป็นหนังที่ "คนชอบ" มากกว่า "ทำเงิน"
5. หนังแนว Horror มีเรตติ้งต่ำที่สุด (~6.1)
