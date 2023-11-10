module.exports = {
  content: [
    "./_drafts/**/*.html",
    "./_includes/**/*.html",
    "./_layouts/**/*.html",
    "./_posts/*.md",
    "./*.md",
    "./*.html",
  ],
  theme: {
    theme: {
      extend: {
        colors: {
          // Background colors
          background: "#FFF2DC",
          "inner-shadow": "#E9D3AC",
          "outer-shadow": "#FFFDF5",

          // Main colors
          primary: "#FFC04D",
          secondary: "#FFA000",
          text: "#4D4D4D",

          // Accent colors
          accent1: "#D27D00",
          accent2: "#A36D6D",

          // Hover and active states (you can adjust these as needed)
          "hover-primary": "#FFD073",
          "hover-secondary": "#FF8A00",

          // Error and success colors
          error: "#FF0000",
          success: "#00FF00",
        },
      },
    },
  },
  plugins: [require("tailwindcss-neumorphism")],
};
