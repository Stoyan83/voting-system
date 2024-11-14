import { createRoot } from "react-dom/client";
import App from "./config/app/App";
import React from 'react'


const initializeApp = () => {
  const rootElement = document.createElement("div");
  rootElement.id = "root";
  document.body.appendChild(rootElement);

  const root = createRoot(rootElement);
  root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>
  );
};

document.addEventListener("turbo:load", initializeApp);
