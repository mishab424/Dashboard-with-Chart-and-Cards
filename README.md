# APEX Dashboard Plugin

A customizable and modern Oracle APEX dashboard plugin with toggleable dark/light themes, animated progress cards, and role-wise KPI visualizations.

![Light Mode](images/dashboard-light.png)
![Dark Mode](images/dashboard-dark.png)

---

## 🌟 Features

- Interactive chart toggling (light/dark)
- Card-based progress display with user photos
- Role-based KPI breakdown (Team Lead, Regional Manager, Sales Agent)
- Fully responsive layout with animated transitions
- Plugin adapts to any theme using CSS variables

---

## 🔧 Use Cases

- Sales team dashboards
- Agent performance trackers
- Executive overviews
- Lead conversion and KPI tracking

---

## 📦 Installation

1. **Import Plugin**
   - Download `plugin.sql` from `/src/`
   - Go to **SQL Workshop > SQL Scripts** in Oracle APEX
   - Upload and run the script to install the plugin

2. **Create Region**
   - Go to your page → Add Region
   - Set Region Type to: **Dashboard Plugin**
   - Set **Chart Source Type** to **SQL Query**

3. **Add Static Files**
   - Go to **Shared Components > Static Application Files**
   - Upload:
     - `style.css` from `/css/`
     - `script.js` from `/js/`
   - In your page → Page Attributes → Execute When Page Loads:
     ```html
     <link rel="stylesheet" href="#APP_IMAGES#style.css">
     <script src="#APP_IMAGES#script.js"></script>
     ```

---

## 🧾 Sample Data Query

Use this PL/SQL or SQL as a region source to populate the dashboard:


```sql
SELECT 
    employee_name,
    achieved_count AS value,
    progress_percentage AS progress,
    profile_photo_url AS photo
FROM employee_dashboard_progress
ORDER BY progress DESC;

**screenshorts**

<img width="622" height="707" alt="Screenshot 2025-07-10 171856" src="https://github.com/user-attachments/assets/9fb3ec6f-46cd-4781-9309-66f8680907c1" />
