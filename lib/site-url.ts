const configuredUrl =
  process.env.NEXT_PUBLIC_SITE_URL ||
  process.env.VERCEL_PROJECT_PRODUCTION_URL ||
  process.env.VERCEL_URL ||
  'http://localhost:3000'

const absoluteUrl = /^https?:\/\//i.test(configuredUrl)
  ? configuredUrl
  : `https://${configuredUrl}`

export const siteUrl = new URL(absoluteUrl)
