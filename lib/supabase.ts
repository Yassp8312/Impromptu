import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export interface Category {
  id: string
  name: string
  icon: string
  created_at: string
  updated_at: string
}

export interface Topic {
  id: string
  title: string
  category_id: string
  mode: 'improvisado' | 'profundo'
  created_at: string
  updated_at: string
}

export interface CategoryWithTopics extends Category {
  topics: Topic[]
}
