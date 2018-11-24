defmodule P14NeplacesWeb.VisitController do
  use P14NeplacesWeb, :controller

  alias P14Neplaces.Places
  alias P14Neplaces.Places.Visit

  def index(conn, _params) do
    visits = Places.list_visits()
    render(conn, "index.html", visits: visits)
  end

  def new(conn, _params) do
    changeset = Places.change_visit(%Visit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visit" => visit_params}) do
    case Places.create_visit(visit_params) do
      {:ok, visit} ->
        conn
        |> put_flash(:info, "Visit created successfully.")
        |> redirect(to: Routes.visit_path(conn, :show, visit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visit = Places.get_visit!(id)
    render(conn, "show.html", visit: visit)
  end

  def edit(conn, %{"id" => id}) do
    visit = Places.get_visit!(id)
    changeset = Places.change_visit(visit)
    render(conn, "edit.html", visit: visit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visit" => visit_params}) do
    visit = Places.get_visit!(id)

    case Places.update_visit(visit, visit_params) do
      {:ok, visit} ->
        conn
        |> put_flash(:info, "Visit updated successfully.")
        |> redirect(to: Routes.visit_path(conn, :show, visit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visit: visit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit = Places.get_visit!(id)
    {:ok, _visit} = Places.delete_visit(visit)

    conn
    |> put_flash(:info, "Visit deleted successfully.")
    |> redirect(to: Routes.visit_path(conn, :index))
  end
end
