import React from 'react'
import { createBrowserRouter } from "react-router-dom"
import NotFound from "../../pages/NotFound"
import Home from "../../pages/Home"

const router = createBrowserRouter(
  [
    {
      path: "*",
      element: <></>
    },
    {
      path: "/modern/*",
      children: [
        {
          path: "home",
          element: <Home />
        },
        {
          path: "*",
          element: <NotFound />
        },
      ]
    },
  ],
  {
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
