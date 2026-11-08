# 🚀 Google Cloud Study Jams - 10/10 Skill Badges Speedrun Guide

Complete, verified, and 1-click solutions for all **10 Required Skill Badges** in the **Google Cloud Learn with Communities (Study Jam)** program.

> [!IMPORTANT]
> ### ⚠️ STEP 0: Check Your Assigned Region & Zone!
> Google Cloud assigns each student a specific **Region** and **Zone** (e.g., `us-central1`, `us-east1`, `us-west1-b`, etc.) in the left lab panel or task instructions.
> **Before running any script:** Check the top 2 lines of the script and make sure `REGION` and `ZONE` match your assigned values:
> ```bash
> export REGION="us-east1"    # <-- Update to your assigned region
> export ZONE="us-east1-b"    # <-- Update to your assigned zone
> ```
> *If you deploy in the wrong region, the automated grader will not be able to find your resources and your score will remain 0!*

> [!TIP]
> ### ⚡ The Golden Speedrun Trick (Save 20+ Hours):
> You **do NOT need to do all 5-6 prerequisite learning labs** inside each course! 
> 1. Run the **Challenge Lab** directly using the scripts in this repository to get **100/100 score**.
> 2. Click **End Lab**.
> 3. Go to the course catalog, open the **`Course | Skill badge`** card (links below), and simply click **`Start`**.
> 4. **BOOM!** The system detects your 100% challenge lab score and immediately awards **"COURSE COMPLETED ✓"** and unlocks your official Skill Badge in 5 seconds!

---

## 🏆 10-Badge Roadmap, Direct Links & Quick Index

| # | Skill Badge Name | Lab ID | 🔗 Direct Lab Link | 🎓 Course Claim Link | Solution Folder |
|---|------------------|:------:|:------------------:|:--------------------:|:---------------:|
| 1 | **The Basics of Google Cloud Compute** | ARC120 | [Open Lab](https://www.cloudskillsboost.google/focuses/44154?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/644) | [`01-Compute`](./01-The-Basics-of-Google-Cloud-Compute/) |
| 2 | **Using the Google Cloud Speech API** | ARC131 | [Open Lab](https://www.cloudskillsboost.google/focuses/44299?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/678) | [`02-Speech-API`](./02-Using-the-Google-Cloud-Speech-API/) |
| 3 | **Configure Service Accounts and IAM Roles** | ARC134 | [Open Lab](https://www.cloudskillsboost.google/focuses/44301?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/702) | [`03-IAM-Roles`](./03-Configure-Service-Accounts-and-IAM-Roles/) |
| 4 | **Implement Speech and Language Solutions** | ARC132 | [Open Lab](https://www.cloudskillsboost.google/focuses/44300?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/679) | [`04-Speech-Language`](./04-Implement-Speech-and-Language-Solutions/) |
| 5 | **Develop AI-Powered Prototypes in AI Studio** | GSP529 | [Open Lab](https://www.cloudskillsboost.google/focuses/105436?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/997) | [`05-AI-Studio`](./05-Develop-AI-Powered-Prototypes-in-Google-AI-Studio/) |
| 6 | **Build a Website on Google Cloud** | GSP319 | [Open Lab](https://www.cloudskillsboost.google/focuses/1160?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/638) | [`06-Website`](./06-Build-a-Website-on-Google-Cloud/) |
| 7 | **Store, Process, and Manage Data on Google Cloud** | ARC100 | [Open Lab](https://www.cloudskillsboost.google/focuses/44155?parent=catalog) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/658) | [`07-Store-Data`](./07-Store-Process-and-Manage-Data-on-Google-Cloud/) |
| 8 | **Create Your First Gemini Enterprise Application** | Quiz | [Open Course & Quiz](https://www.cloudskillsboost.google/course_templates/1068) | [Claim Badge](https://www.cloudskillsboost.google/course_templates/1068) | [`08-Gemini-Enterprise`](./08-Create-Your-First-Gemini-Enterprise-Application/) |
| 9 | **Explore Generative AI in Agent Platform** | GSP515 | [Open Lab](https://skills.google/focuses/85653?parent=catalog) | [Claim Badge](https://skills.google/course_templates/959) | [`09-Agent-Platform`](./09-Explore-Generative-AI-in-Agent-Platform/) |
| 10 | **Analyze Images with the Cloud Vision API** | ARC122 | [Open Lab](https://skills.google/focuses/64748?parent=catalog) | [Claim Badge](https://skills.google/course_templates/633) | [`10-Vision-API`](./10-Analyze-Images-with-the-Cloud-Vision-API/) |

---

## 🛠️ Step-by-Step Speedrun Workflow

1. **Always use an Incognito / Private Window** when signing into Google Cloud Console to prevent account collision with your personal Gmail.
2. Click **Start Lab** on the **Challenge Lab**.
3. Open **Cloud Shell** (`>_`) in Google Cloud Console.
4. Open the solution file for that badge, **check the `REGION` / `ZONE` variables**, and paste the script into Cloud Shell.
5. Wait for the `=== COMPLETED 100/100 ===` message.
6. Click **Check my progress** for all tasks on the lab instructions page to verify you got **100/100**.
7. Click **End Lab**.
8. Click the **Claim Badge** link from the table above (or search the course name), and click **`Start`** on the Course page.
9. **Instant Badge Earned!** Your profile will update immediately.

---

## 📂 Repository Structure

```
├── 01-The-Basics-of-Google-Cloud-Compute/
│   ├── README.md
│   └── solution.sh
├── 02-Using-the-Google-Cloud-Speech-API/
│   ├── README.md
│   └── solution.sh
├── 03-Configure-Service-Accounts-and-IAM-Roles/
│   ├── README.md
│   └── solution.sh
├── 04-Implement-Speech-and-Language-Solutions/
│   ├── README.md
│   └── solution.sh
├── 05-Develop-AI-Powered-Prototypes-in-Google-AI-Studio/
│   └── README.md
├── 06-Build-a-Website-on-Google-Cloud/
│   ├── README.md
│   └── solution.sh
├── 07-Store-Process-and-Manage-Data-on-Google-Cloud/
│   ├── README.md
│   └── solution.sh
├── 08-Create-Your-First-Gemini-Enterprise-Application/
│   └── README.md
├── 09-Explore-Generative-AI-in-Agent-Platform/
│   ├── README.md
│   ├── task1_curl.sh
│   └── notebook_code.py
├── 10-Analyze-Images-with-the-Cloud-Vision-API/
│   ├── README.md
│   └── solution.sh
└── README.md
```

---

## 🤝 Community & Support

Made with ❤️ by [Shafaq Irshad](https://github.com/shafaq-codes) for Google Cloud Study Jams Community!  
Feel free to star ⭐ this repository and share it with your batchmates.
