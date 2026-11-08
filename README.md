# 🚀 Google Cloud Study Jams - 10/10 Skill Badges Speedrun Guide

Complete, verified, and 1-click solutions for all **10 Required Skill Badges** in the **Google Cloud Learn with Communities (Study Jam)** program, arranged in the exact order of the Study Jams Dashboard.

> [!TIP]
> 💡 **New Tab Shortcut:** GitHub's built-in security policies intentionally prevent markdown links from forcing a new tab automatically. To keep this guide open while starting your labs, open all links in a new tab by holding **`Ctrl` + Click** (Windows) or **`Cmd` + Click** (Mac), or by clicking with your **Mouse Wheel / Middle Click**!

> [!IMPORTANT]
> ### ⚠️ STEP 0: Check Your Assigned Region & Zone!
> Google Cloud assigns each student a specific **Region** and **Zone** (e.g., `us-central1`, `us-east1`, `us-west1-b`, etc.) in the left lab panel or task instructions.
> **Before running any script:** Check the top 2 lines of the script and make sure `REGION` and `ZONE` match your assigned values:
> ```bash
> export REGION="us-east1"    # <-- Update to your assigned region
> export ZONE="us-east1-b"    # <-- Update to your assigned zone
> ```
> *If you deploy in the wrong region, the automated grader will not be able to find your resources and your score will remain 0!*

> [!NOTE]
> ### ⚡ The Golden Speedrun Trick (Save 20+ Hours):
> You **do NOT need to do all 5-6 prerequisite learning labs** inside each course! 
> 1. Open the course page using the links below and start the **Challenge Lab** directly.
> 2. Run the 1-click script from this repository in Cloud Shell to get **100/100 score**.
> 3. Click **End Lab**.
> 4. Go back to the Course page, and simply click **`Start`**.
> 5. **BOOM!** The system detects your 100% challenge lab score and immediately awards **"COURSE COMPLETED ✓"** and unlocks your official Skill Badge in 5 seconds!

---

## 🏆 10-Badge Roadmap & Direct Course Links (Exact Dashboard Sequence)

*(Hold **`Ctrl` + Click** or **Middle-Click** to open in a new tab without leaving GitHub)*

| # | Skill Badge Name | Lab ID | 🔗 Direct Course & Lab Link | Solution Folder |
|---|------------------|:------:|:---------------------------:|:---------------:|
| 1 | **The Basics of Google Cloud Compute** | ARC120 | [Open Course & Lab ↗](https://skills.google/course_templates/644) | [`01-The-Basics-of-Google-Cloud-Compute`](./01-The-Basics-of-Google-Cloud-Compute/) |
| 2 | **Configure Service Accounts and IAM Roles for Google Cloud** | ARC134 | [Open Course & Lab ↗](https://skills.google/course_templates/702) | [`02-Configure-Service-Accounts-and-IAM-Roles`](./02-Configure-Service-Accounts-and-IAM-Roles/) |
| 3 | **Implement Speech and Language Solutions with Pre-trained APIs** | ARC132 | [Open Course & Lab ↗](https://skills.google/course_templates/679) | [`03-Implement-Speech-and-Language-Solutions`](./03-Implement-Speech-and-Language-Solutions/) |
| 4 | **Develop AI-Powered Prototypes in Google AI Studio** | GSP529 | [Open Course & Lab ↗](https://skills.google/course_templates/997) | [`04-Develop-AI-Powered-Prototypes-in-Google-AI-Studio`](./04-Develop-AI-Powered-Prototypes-in-Google-AI-Studio/) |
| 5 | **Analyze Images with the Cloud Vision API** | ARC122 | [Open Course & Lab ↗](https://skills.google/course_templates/633) | [`05-Analyze-Images-with-the-Cloud-Vision-API`](./05-Analyze-Images-with-the-Cloud-Vision-API/) |
| 6 | **Build a Website on Google Cloud** | GSP319 | [Open Course & Lab ↗](https://skills.google/course_templates/638) | [`06-Build-a-Website-on-Google-Cloud`](./06-Build-a-Website-on-Google-Cloud/) |
| 7 | **Create Your First Gemini Enterprise Application** | Quiz | [Open Course & Quiz ↗](https://skills.google/course_templates/1068) | [`07-Create-Your-First-Gemini-Enterprise-Application`](./07-Create-Your-First-Gemini-Enterprise-Application/) |
| 8 | **Store, Process, and Manage Data on Google Cloud - Console** | ARC100 | [Open Course & Lab ↗](https://skills.google/course_templates/658) | [`08-Store-Process-and-Manage-Data-on-Google-Cloud`](./08-Store-Process-and-Manage-Data-on-Google-Cloud/) |
| 9 | **Using the Google Cloud Speech API** | ARC131 | [Open Course & Lab ↗](https://skills.google/course_templates/678) | [`09-Using-the-Google-Cloud-Speech-API`](./09-Using-the-Google-Cloud-Speech-API/) |
| 10 | **Explore Generative AI in Agent Platform** | GSP515 | [Open Course & Lab ↗](https://skills.google/course_templates/959) | [`10-Explore-Generative-AI-in-Agent-Platform`](./10-Explore-Generative-AI-in-Agent-Platform/) |

---

## 🛠️ Step-by-Step Speedrun Workflow

1. **Always use an Incognito / Private Window** when signing into Google Cloud Console to prevent account collision with your personal Gmail.
2. Hold **`Ctrl` + Click** on the **Direct Course & Lab Link** from the table above to open the course in a new tab.
3. Scroll to the **Challenge Lab** inside the course and click **Start Lab**.
4. Open **Cloud Shell** (`>_`) in Google Cloud Console.
5. Open the solution file for that badge, **check the `REGION` / `ZONE` variables**, and paste the script into Cloud Shell.
6. Wait for the `=== COMPLETED 100/100 ===` message.
7. Click **Check my progress** for all tasks on the lab instructions page to verify you got **100/100**.
8. Click **End Lab**.
9. Return to the Course tab and click **`Start`**.
10. **Instant Badge Earned!** Your profile will update immediately with **COURSE COMPLETED ✓**.

---

## 📂 Repository Structure

```
├── 01-The-Basics-of-Google-Cloud-Compute/
│   ├── README.md
│   └── solution.sh
├── 02-Configure-Service-Accounts-and-IAM-Roles/
│   ├── README.md
│   └── solution.sh
├── 03-Implement-Speech-and-Language-Solutions/
│   ├── README.md
│   └── solution.sh
├── 04-Develop-AI-Powered-Prototypes-in-Google-AI-Studio/
│   └── README.md
├── 05-Analyze-Images-with-the-Cloud-Vision-API/
│   ├── README.md
│   └── solution.sh
├── 06-Build-a-Website-on-Google-Cloud/
│   ├── README.md
│   └── solution.sh
├── 07-Create-Your-First-Gemini-Enterprise-Application/
│   └── README.md
├── 08-Store-Process-and-Manage-Data-on-Google-Cloud/
│   ├── README.md
│   └── solution.sh
├── 09-Using-the-Google-Cloud-Speech-API/
│   ├── README.md
│   └── solution.sh
├── 10-Explore-Generative-AI-in-Agent-Platform/
│   ├── README.md
│   ├── task1_curl.sh
│   └── notebook_code.py
└── README.md
```

---

## 🤝 Community & Support

Made with ❤️ by [Shafaq Irshad](https://github.com/shafaq-codes) for Google Cloud Study Jams Community!  
Feel free to star ⭐ this repository and share it with your batchmates.
