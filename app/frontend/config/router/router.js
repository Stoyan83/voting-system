import React from 'react'
import { createBrowserRouter } from "react-router-dom"
import NotFound from "../../pages/NotFound"
import Home from "../../pages/Home"

const router = createBrowserRouter(
  [
    {
      path: "/",
      errorElement: <NotFound />,
      children: [
        { path: "/", element: <Home /> },
      ]
    }
  ],
  { // These flags clear deprecation warnings for React Router v7.
    // https://reactrouter.com/en/main/upgrading/future
    future: {
      v7_startTransition: true,
      v7_fetcherPersist: true,
      v7_normalizeFormMethod: true,
      v7_partialHydration: true,
      v7_relativeSplatPath: true,
      v7_skipActionErrorRevalidation: true,
    }
  }
);

export default router;
