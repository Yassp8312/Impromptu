import { Analytics } from '@vercel/analytics/next'
import type { Metadata, Viewport } from 'next'
import { siteUrl } from '@/lib/site-url'
import './globals.css'

export const metadata: Metadata = {
  metadataBase: siteUrl,
  applicationName: 'Impromptu',
  title: {
    default: 'Impromptu — Practica y mejora tu oratoria',
    template: '%s | Impromptu',
  },
  description:
    'Mejora tu oratoria con temas aleatorios, ejercicios de improvisación, investigación profunda y un temporizador de práctica.',
  keywords: [
    'oratoria',
    'improvisación',
    'hablar en público',
    'ejercicios de oratoria',
    'temas para improvisar',
    'comunicación',
    'práctica de discursos',
  ],
  authors: [{ name: 'J.C/Yassper' }],
  creator: 'J.C/Yassper',
  publisher: 'Impromptu',
  category: 'education',
  alternates: {
    canonical: '/',
  },
  openGraph: {
    type: 'website',
    locale: 'es_ES',
    url: '/',
    siteName: 'Impromptu',
    title: 'Impromptu — Practica y mejora tu oratoria',
    description:
      'Entrena tu capacidad para hablar en público con temas aleatorios, improvisación e investigación profunda.',
    images: [
      {
        url: '/og-image.png',
        width: 2048,
        height: 1152,
        alt: 'Impromptu, plataforma para practicar oratoria',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Impromptu — Practica y mejora tu oratoria',
    description:
      'Entrena tu capacidad para hablar en público con temas aleatorios, improvisación e investigación profunda.',
    images: ['/og-image.png'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-image-preview': 'large',
      'max-snippet': -1,
      'max-video-preview': -1,
    },
  },
}

export const viewport: Viewport = {
  colorScheme: 'light dark',
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: '#eee4d4' },
    { media: '(prefers-color-scheme: dark)', color: '#2d2025' },
  ],
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="es" className="bg-background">
      <body className="antialiased">
        {children}
        {process.env.NODE_ENV === 'production' && <Analytics />}
      </body>
    </html>
  )
}
