import { createClient } from "@supabase/supabase-js";

export const config = { runtime: "edge" };

export default async function handler(req: Request) {
  try {
    const body = await req.json().catch(() => null);

    if (!body?.employee_code) {
      return new Response(
        JSON.stringify({ success: false, message: "employee_code manquant" }),
        { status: 400 }
      );
    }

    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
    );

    // Vérifier si l’employé existe
    const { data, error } = await supabase
      .from("employees")
      .select("id, name, token")
      .eq("employee_code", body.employee_code)
      .single();

    if (error || !data) {
      return new Response(
        JSON.stringify({ success: false, message: "Employé introuvable" }),
        { status: 404 }
      );
    }

    return new Response(
      JSON.stringify({
        success: true,
        id: data.id,
        name: data.name,
        token: data.token,
      }),
      { status: 200 }
    );
  } catch (err: any) {
    return new Response(
      JSON.stringify({
        success: false,
        message: "Erreur interne du serveur",
        error: err?.message,
      }),
      { status: 500 }
    );
  }
}
