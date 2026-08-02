(function () {
  var KEY = "amplio-legal-lang";
  var buttons = document.querySelectorAll("[data-set-lang]");
  var panels = document.querySelectorAll("[data-lang-panel]");

  function apply(lang) {
    document.documentElement.lang = lang === "zh" ? "zh-CN" : "en";
    panels.forEach(function (panel) {
      panel.classList.toggle("is-active", panel.getAttribute("data-lang-panel") === lang);
    });
    buttons.forEach(function (btn) {
      var on = btn.getAttribute("data-set-lang") === lang;
      btn.setAttribute("aria-pressed", on ? "true" : "false");
    });
    try {
      localStorage.setItem(KEY, lang);
    } catch (e) {}
  }

  var saved = null;
  try {
    saved = localStorage.getItem(KEY);
  } catch (e) {}
  var initial =
    saved === "zh" || saved === "en"
      ? saved
      : navigator.language && navigator.language.toLowerCase().indexOf("zh") === 0
        ? "zh"
        : "en";

  apply(initial);

  buttons.forEach(function (btn) {
    btn.addEventListener("click", function () {
      apply(btn.getAttribute("data-set-lang"));
    });
  });
})();
