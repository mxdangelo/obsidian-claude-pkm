---
date: <% window.moment(tp.file.title, "YYYY-MM-DD").format("YYYY-MM-DD") %>
tags: [daily-note]
---

# <% window.moment(tp.file.title, "YYYY-MM-DD").format("dddd, MMMM DD, YYYY") %>

---

## 📝 Notes of the day


---

## 📅 Today

<%*
// Pull today's appointments from the Agenda (day format "Wed 24"). All at creation, no Claude.
const ref = tp.file.title;
const today = window.moment(ref, "YYYY-MM-DD").format("ddd D");
let agenda = "";
try { agenda = await tp.file.include("[[Agenda]]"); } catch (e) { agenda = ""; }
const items = [];
const seen = new Set();
for (const line of (agenda || "").split("\n")) {
  const t = line.trim();
  if (t.startsWith("## Archive")) break;           // don't pull from the archive
  if (!t.startsWith("|")) continue;
  const c = t.split("|").map(x => x.trim());
  if (c.length < 4 || c[1] !== today) continue;
  const time = c[2] && c[2] !== "—" ? c[2] : "";
  const item = c[3] || "";
  if (!item) continue;
  const key = time + "|" + item;
  if (seen.has(key)) continue;
  seen.add(key);
  const note = c[4] || "";
  const m = time.match(/^(\d{1,2}):(\d{2})/);
  const sort = m ? parseInt(m[1]) * 60 + parseInt(m[2]) : 9999;
  items.push({ sort, text: "- " + (time ? time + " — " : "") + item + (note ? " (" + note + ")" : "") });
}
items.sort((a, b) => a.sort - b.sort);
tR += items.length ? items.map(i => i.text).join("\n") : "- ";
%>

---

## ✅ Tasks

### 🔴 To do today

```dataview
TASK FROM "Projects"
WHERE plan = this.file.day
SORT est DESC
```

---

## 🔗 Related
- [[Weekly Review <% window.moment(tp.file.title, "YYYY-MM-DD").format("YYYY-[W]WW") %>|Week]]
- Yesterday: [[<% window.moment(tp.file.title, "YYYY-MM-DD").add(-1, "days").format("YYYY-MM-DD") %>]]
- Tomorrow: [[<% window.moment(tp.file.title, "YYYY-MM-DD").add(1, "days").format("YYYY-MM-DD") %>]]

---

*Day <% window.moment(tp.file.title, "YYYY-MM-DD").format("DDD") %> of 365 · Week <% window.moment(tp.file.title, "YYYY-MM-DD").format("WW") %> of 52*
