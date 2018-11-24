defmodule P14NeplacesWeb.VisitControllerTest do
  use P14NeplacesWeb.ConnCase

  alias P14Neplaces.Places

  @create_attrs %{date: ~D[2010-04-17], description: "some description", place: "some place", rating: 42, state: "some state", time: ~T[14:00:00]}
  @update_attrs %{date: ~D[2011-05-18], description: "some updated description", place: "some updated place", rating: 43, state: "some updated state", time: ~T[15:01:01]}
  @invalid_attrs %{date: nil, description: nil, place: nil, rating: nil, state: nil, time: nil}

  def fixture(:visit) do
    {:ok, visit} = Places.create_visit(@create_attrs)
    visit
  end

  describe "index" do
    test "lists all visits", %{conn: conn} do
      conn = get(conn, Routes.visit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visits"
    end
  end

  describe "new visit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visit"
    end
  end

  describe "create visit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visit_path(conn, :create), visit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visit_path(conn, :show, id)

      conn = get(conn, Routes.visit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visit_path(conn, :create), visit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visit"
    end
  end

  describe "edit visit" do
    setup [:create_visit]

    test "renders form for editing chosen visit", %{conn: conn, visit: visit} do
      conn = get(conn, Routes.visit_path(conn, :edit, visit))
      assert html_response(conn, 200) =~ "Edit Visit"
    end
  end

  describe "update visit" do
    setup [:create_visit]

    test "redirects when data is valid", %{conn: conn, visit: visit} do
      conn = put(conn, Routes.visit_path(conn, :update, visit), visit: @update_attrs)
      assert redirected_to(conn) == Routes.visit_path(conn, :show, visit)

      conn = get(conn, Routes.visit_path(conn, :show, visit))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, visit: visit} do
      conn = put(conn, Routes.visit_path(conn, :update, visit), visit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visit"
    end
  end

  describe "delete visit" do
    setup [:create_visit]

    test "deletes chosen visit", %{conn: conn, visit: visit} do
      conn = delete(conn, Routes.visit_path(conn, :delete, visit))
      assert redirected_to(conn) == Routes.visit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visit_path(conn, :show, visit))
      end
    end
  end

  defp create_visit(_) do
    visit = fixture(:visit)
    {:ok, visit: visit}
  end
end
